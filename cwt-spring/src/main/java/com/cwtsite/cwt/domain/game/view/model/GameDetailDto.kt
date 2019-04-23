package com.cwtsite.cwt.domain.game.view.model

import com.cwtsite.cwt.domain.game.entity.Game
import com.cwtsite.cwt.domain.game.entity.PlayoffGame
import com.cwtsite.cwt.domain.game.entity.Rating
import com.cwtsite.cwt.domain.group.entity.Group
import com.cwtsite.cwt.domain.tournament.entity.Tournament
import com.cwtsite.cwt.domain.user.repository.entity.User
import com.cwtsite.cwt.entity.Comment
import java.util.*

class GameDetailDto(
        val id: Long,
        val scoreHome: Int,
        val scoreAway: Int,
        val techWin: Boolean,
        val created: Date,
        val modified: Date,
        val playoff: PlayoffGame?,
        val group: Group?,
        val tournament: Tournament,
        val homeUser: User,
        val awayUser: User,
        val reporter: User,
        val ratings: List<Rating>,
        val comments: List<Comment>,
        val isReplayExists: Boolean
) {

    companion object {

        fun toDto(game: Game): GameDetailDto {
            return GameDetailDto(
                    id = game.id!!,
                    scoreHome = game.scoreHome!!,
                    scoreAway = game.scoreAway!!,
                    techWin = game.techWin,
                    created = game.created!!,
                    modified = game.modified!!,
                    playoff = game.playoff,
                    group = game.group,
                    tournament = game.tournament,
                    homeUser = game.homeUser!!,
                    awayUser = game.awayUser!!,
                    reporter = game.reporter!!,
                    ratings = game.ratings,
                    comments = game.comments,
                    isReplayExists = game.replay != null
            )
        }
    }
}
