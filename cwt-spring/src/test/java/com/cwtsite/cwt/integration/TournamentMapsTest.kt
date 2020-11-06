package com.cwtsite.cwt.integration

import com.cwtsite.cwt.domain.game.entity.Game
import com.cwtsite.cwt.domain.game.entity.GameStats
import com.cwtsite.cwt.domain.game.service.GameRepository
import com.cwtsite.cwt.domain.game.service.GameStatsRepository
import com.cwtsite.cwt.domain.tournament.entity.Tournament
import com.cwtsite.cwt.domain.tournament.service.TournamentRepository
import com.cwtsite.cwt.domain.user.repository.UserRepository
import com.cwtsite.cwt.domain.user.repository.entity.User
import org.assertj.core.api.Assertions.assertThat
import org.hamcrest.Matchers.`is`
import org.hamcrest.Matchers.hasSize
import org.junit.Before
import org.junit.FixMethodOrder
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.http.MediaType
import org.springframework.test.context.junit4.SpringRunner
import org.springframework.test.web.servlet.MockMvc
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get
import org.springframework.test.web.servlet.result.MockMvcResultHandlers.print
import org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath
import org.springframework.test.web.servlet.result.MockMvcResultMatchers.status
import java.io.BufferedReader
import java.sql.Timestamp
import kotlin.test.Test

@RunWith(SpringRunner::class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@AutoConfigureMockMvc
@EmbeddedPostgres
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
class TournamentMapsTest {

    @Autowired
    private lateinit var mockMvc: MockMvc

    @Autowired
    private lateinit var gameRepository: GameRepository

    @Autowired
    private lateinit var gameStatsRepository: GameStatsRepository

    @Autowired
    private lateinit var tournamentRepository: TournamentRepository

    @Autowired
    private lateinit var userRepository: UserRepository

    companion object {

        @JvmStatic
        private var game: Game? = null

        @JvmStatic
        private var tournament: Tournament? = null

        @JvmStatic
        val manhattanJson = TournamentMapsTest::class.java
                .getResourceAsStream("/com/cwtsite/cwt/domain/game/service/manhattan.json")!!
                .bufferedReader().use(BufferedReader::readText)

        @JvmStatic
        val hellJson = TournamentMapsTest::class.java
                .getResourceAsStream("/com/cwtsite/cwt/domain/game/service/hell.json")!!
                .bufferedReader().use(BufferedReader::readText)
    }

    @Before
    fun setUp() {
        tournament = tournamentRepository.save(Tournament())
        val user1 = userRepository.save(User(email = "email1@example.com", username = "example1"))
        val user2 = userRepository.save(User(email = "email2@example.com", username = "example2"))
        game = gameRepository.save(Game(
                tournament = tournament!!,
                scoreHome = 0, scoreAway = 3,
                homeUser = user1, awayUser = user2,
                reportedAt = Timestamp(1602940004706)))
        gameStatsRepository.save(GameStats(data = manhattanJson, map = "/map/tx3qwuc3", game = game, startedAt = Timestamp(1602940004706)))
        gameStatsRepository.save(GameStats(data = hellJson, map = "/map/dqp2fnf9", game = game, startedAt = Timestamp(1602940014706)))
    }

    @Test
    fun `get maps of tournament`() {
        assertThat(game!!.wasPlayed()).isTrue()
        mockMvc
                .perform(get("/api/tournament/${tournament!!.id}/maps")
                        .contentType(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isOk)
                .andExpect(jsonPath("$", hasSize<String>(2)))
                .andExpect(jsonPath("$[0].texture", `is`("DATA\\Level\\Manhattan")))
                .andExpect(jsonPath("$[0].game.id", `is`(game!!.id!!.toInt())))
                .andExpect(jsonPath("$[0].mapPath", `is`("/map/tx3qwuc3")))
                .andExpect(jsonPath("$[1].texture", `is`("DATA\\Level\\Hell")))
                .andExpect(jsonPath("$[1].game.id", `is`(game!!.id!!.toInt())))
                .andExpect(jsonPath("$[1].mapPath", `is`("/map/dqp2fnf9")))
    }

}