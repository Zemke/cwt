package com.cwtsite.cwt.tournament.service;

import com.cwtsite.cwt.entity.Tournament;
import com.cwtsite.cwt.entity.enumeration.TournamentStatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TournamentRepository extends JpaRepository<Tournament, Long> {
    long countByStatusNot(TournamentStatus status);

    Tournament findByStatusNot(TournamentStatus status);
}
