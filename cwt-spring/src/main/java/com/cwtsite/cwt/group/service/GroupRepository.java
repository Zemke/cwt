package com.cwtsite.cwt.group.service;

import com.cwtsite.cwt.tournament.entity.Tournament;
import com.cwtsite.cwt.group.entity.Group;
import com.cwtsite.cwt.user.repository.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface GroupRepository extends JpaRepository<Group, Long> {

    List<Group> findByTournament(Tournament tournament);

    @Query("select g from Group g join g.standings s where s.user = :user and g.tournament = :tournament")
    Group findByTournamentAndUser(@Param("tournament") Tournament tournament, @Param("user") User user);
}
