package com.cwtsite.cwt.domain.tournament.service

import com.cwtsite.cwt.domain.application.service.ApplicationRepository
import com.cwtsite.cwt.domain.game.entity.Game
import com.cwtsite.cwt.domain.game.service.GameRepository
import com.cwtsite.cwt.domain.tournament.entity.Tournament
import com.cwtsite.cwt.domain.tournament.entity.enumeration.TournamentStatus
import com.cwtsite.cwt.domain.user.repository.UserRepository
import com.cwtsite.cwt.entity.Application
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Component
import org.springframework.transaction.annotation.Transactional
import java.util.*

@Component
class TournamentService @Autowired
constructor(private val userRepository: UserRepository, private val tournamentRepository: TournamentRepository,
            private val applicationRepository: ApplicationRepository, private val gameRepository: GameRepository) {

    @Throws(IllegalStateException::class)
    fun startNewTournament(moderatorIds: List<Long>): Tournament {
        val numberOfUnarchivedTournaments = tournamentRepository.countByStatusNot(TournamentStatus.ARCHIVED)

        if (numberOfUnarchivedTournaments > 0) {
            throw IllegalStateException("For a new tournament to start it is required that all tournaments are archived.")
        }

        val tournament = Tournament()
        tournament.moderators = userRepository.findAllById(moderatorIds).toSet()
        tournament.status = TournamentStatus.OPEN

        return tournamentRepository.save(tournament)
    }

    @Transactional
    fun startPlayoffs(games: List<Game>): List<Game> {
        val currentTournament = getCurrentTournament()
        currentTournament.status = TournamentStatus.PLAYOFFS
        tournamentRepository.save(currentTournament)
        return gameRepository.saveAll(games)
    }

    fun getTournament(id: Long): Optional<Tournament> {
        return tournamentRepository.findById(id)
    }

    fun getApplicants(tournament: Tournament): List<Application> {
        return this.applicationRepository.findByTournament(tournament)
    }

    fun getTournamentByYear(year: Long): Optional<Tournament> {
        return tournamentRepository.findByYear(year.toInt())
    }

    fun getCurrentTournament(): Tournament = tournamentRepository.findByStatusNot(TournamentStatus.ARCHIVED)
            ?: throw RuntimeException("There is currently no tournament.")

    fun getAll(): List<Tournament> = tournamentRepository.findAll()
}