package com.cwtsite.cwt.domain.user.view.controller

import com.cwtsite.cwt.domain.application.service.ApplicationService
import com.cwtsite.cwt.domain.core.exception.BadRequestException
import com.cwtsite.cwt.domain.core.exception.NotFoundException
import com.cwtsite.cwt.domain.core.view.model.PageDto
import com.cwtsite.cwt.domain.user.repository.entity.User
import com.cwtsite.cwt.domain.user.service.AuthService
import com.cwtsite.cwt.domain.user.service.UserService
import com.cwtsite.cwt.domain.user.view.model.UserChangeDto
import com.cwtsite.cwt.domain.user.view.model.UserDetailDto
import com.cwtsite.cwt.domain.user.view.model.UserOverviewDto
import com.cwtsite.cwt.domain.user.view.model.UserStatsDto
import com.cwtsite.cwt.entity.Application
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Sort
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import java.util.*
import javax.servlet.http.HttpServletRequest

@RestController
@RequestMapping("api/user")
class UserRestController @Autowired
constructor(private val userService: UserService, private val applicationService: ApplicationService, private val authService: AuthService) {

    @RequestMapping("", method = [RequestMethod.GET])
    fun register(): ResponseEntity<List<User>> {
        return ResponseEntity.ok(userService.findAllOrderedByUsername())
    }

    @RequestMapping("/{id}/can-apply", method = [RequestMethod.GET])
    fun userCanApplyForTournament(@PathVariable("id") id: Long): ResponseEntity<Boolean> {
        return ResponseEntity.ok(this.userService.userCanApplyForCurrentTournament(assertUser(id)))
    }

    @RequestMapping("/{usernameOrId}", method = [RequestMethod.GET])
    fun getOne(@PathVariable("usernameOrId") usernameOrId: Any): ResponseEntity<UserDetailDto> {
        return if (usernameOrId is String) {
            val user = userService.findByUsername(usernameOrId)
            ResponseEntity.ok(UserDetailDto.toDto(
                    user, UserStatsDto.toDtos(user.userStats?.timeline ?: userService.createDefaultUserStatsTimeline())))
        } else {
            usernameOrId as Long
            val user = assertUser(usernameOrId)
            ResponseEntity.ok(UserDetailDto.toDto(
                    user,
                    UserStatsDto.toDtos(user.userStats?.timeline ?: userService.createDefaultUserStatsTimeline())))
        }
    }

    @RequestMapping("/{id}/can-report", method = [RequestMethod.GET])
    fun userCanReportForCurrentTournament(@PathVariable("id") id: Long): ResponseEntity<Boolean> {
        return ResponseEntity.ok(this.userService.userCanReportForCurrentTournament(assertUser(id)))
    }

    @RequestMapping("/{id}/application", method = [RequestMethod.POST])
    fun applyForTournament(@PathVariable("id") id: Long): ResponseEntity<Application> {
        return ResponseEntity.ok(this.applicationService.apply(assertUser(id)))
    }

    @RequestMapping("/{id}/group/remaining-opponents", method = [RequestMethod.GET])
    fun getRemainingOpponents(@PathVariable("id") id: Long): ResponseEntity<List<User>> {
        val user = assertUser(id)
        return ResponseEntity.ok(userService.getRemainingOpponents(user))
    }

    @RequestMapping("/page", method = [RequestMethod.GET])
    fun queryUsersPaged(pageDto: PageDto<UserOverviewDto>): ResponseEntity<PageDto<UserOverviewDto>> {
        return ResponseEntity.ok(PageDto.toDto(
                userService.findPaginated(
                        pageDto.start, pageDto.size,
                        pageDto.asSortWithFallback(Sort.Direction.DESC, "userStats.trophyPoints"))
                        .map { user ->
                            UserOverviewDto.toDto(
                                    user,
                                    UserStatsDto.toDtos(user.userStats?.timeline ?: userService.createDefaultUserStatsTimeline())) },
                Arrays.asList(
                        "userStats.trophyPoints,Trophies",
                        "userStats.participations,Participations",
                        "username,Username",
                        "userProfile.country,Country")))
    }

    @RequestMapping("/{id}", method = [RequestMethod.POST])
    fun changeUser(@RequestBody userChangeDto: UserChangeDto,
                   @PathVariable("id") id: Long,
                   request: HttpServletRequest): ResponseEntity<UserChangeDto> {
        var user = assertUser(id)

        if (authService.getUserFromToken(request.getHeader(authService.tokenHeaderName)).id != user.id) {
            throw BadRequestException("You are not allowed to change another user.")
        }

        try {
            user = userService.changeUser(user, userChangeDto.about, userChangeDto.username, userChangeDto.country)
        } catch (e: UserService.InvalidUsernameException) {
            throw BadRequestException("Username invalid.")
        }

        return ResponseEntity.ok(UserChangeDto.toDto(user))
    }

    private fun assertUser(id: Long): User = userService.getById(id).orElseThrow { NotFoundException() }
}