package com.cwtsite.cwt.application.service;

import com.cwtsite.cwt.entity.Application;
import com.cwtsite.cwt.entity.Tournament;
import com.cwtsite.cwt.user.repository.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ApplicationRepository extends JpaRepository<Application, Long> {

    Application findByApplicantAndTournament(User applicant, Tournament tournament);
}