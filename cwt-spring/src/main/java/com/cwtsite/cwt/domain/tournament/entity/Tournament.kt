package com.cwtsite.cwt.domain.tournament.entity

import com.cwtsite.cwt.domain.tournament.entity.enumeration.TournamentStatus
import com.cwtsite.cwt.domain.user.repository.entity.User
import org.hibernate.annotations.CreationTimestamp
import java.sql.Timestamp
import java.util.*
import javax.persistence.*

@Entity
data class Tournament(

        @Id
        @SequenceGenerator(name = "tournament_seq", sequenceName = "tournament_seq", initialValue = 16, allocationSize = 1)
        @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "tournament_seq")
        val id: Long,

        @Enumerated(EnumType.STRING)
        @Column(nullable = false)
        var status: TournamentStatus,

        @Column(columnDefinition = "text")
        var review: String? = null,

        @Column(nullable = false)
        var open: Timestamp,

        @Column(nullable = false)
        var maxRounds: Int,

        @Column(name = "created", nullable = false)
        @CreationTimestamp
        var created: Timestamp? = null,

        @ManyToOne(optional = false)
        var host: User,

        @ManyToOne
        var bronzeWinner: User? = null,

        @ManyToOne
        var silverWinner: User? = null,

        @ManyToOne
        var goldWinner: User? = null,

        @ManyToMany
        @JoinTable(name = "tournament_moderator",
                joinColumns = [JoinColumn(name = "tournaments_id", referencedColumnName = "ID")],
                inverseJoinColumns = [JoinColumn(name = "moderators_id", referencedColumnName = "ID")])
        var moderators: Set<User> = HashSet()
)