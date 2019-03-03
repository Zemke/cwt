package com.cwtsite.cwt.domain.group.view

import com.cwtsite.cwt.domain.group.service.GroupService
import com.cwtsite.cwt.domain.group.view.model.ReplacePlayerDto
import com.cwtsite.cwt.domain.tournament.service.TournamentService
import com.cwtsite.cwt.domain.user.view.model.UserMinimalDto
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("api/group")
class GroupRestController {

    @Autowired private lateinit var groupService: GroupService
    @Autowired private lateinit var tournamentService: TournamentService

    @RequestMapping("")
    fun getAllUsers(): ResponseEntity<List<UserMinimalDto>> {
        return ResponseEntity.ok(groupService.getGroupsForTournament(tournamentService.getCurrentTournament())
                .flatMap { it.standings.map { s -> s.user } }
                .map { UserMinimalDto.toDto(it) })
    }

    @RequestMapping("/replace")
    fun replacePlayer(@RequestBody dto: ReplacePlayerDto): ResponseEntity<Void> {
        groupService.replacePlayer(dto.toBeReplaced, dto.replacement)
        return ResponseEntity.ok().build()
    }
}
