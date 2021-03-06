package com.cwtsite.cwt.domain.configuration.service;

import com.cwtsite.cwt.domain.configuration.entity.Configuration;
import com.cwtsite.cwt.domain.configuration.entity.enumeratuion.ConfigurationKey;
import com.cwtsite.cwt.domain.tournament.service.TournamentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class ConfigurationService {

    private final ConfigurationRepository configurationRepository;
    private final TournamentService tournamentService;

    @Autowired
    public ConfigurationService(ConfigurationRepository configurationRepository,
                                TournamentService tournamentService)  {
        this.configurationRepository = configurationRepository;
        this.tournamentService = tournamentService;
    }

    public List<int[]> getParsedPointsPatternConfiguration() {
        final String rawWithoutWhiteSpace =
                Objects.requireNonNull(getOne(ConfigurationKey.POINTS_PATTERN).getValue())
                        .replaceAll(" ", "");
        final Matcher matcher = Pattern.compile("\\((\\d+,\\d+)\\)").matcher(rawWithoutWhiteSpace);

        final List<int[]> pointsPattern = new ArrayList<>();

        while (matcher.find()) {
            final String[] split = matcher.group(1).split(",");

            if ("0".equals(split[1])) {
                continue;
            }

            pointsPattern.add(new int[]{Integer.parseInt(split[0]), Integer.parseInt(split[1])});
        }

        return pointsPattern;
    }

    public Configuration getOne(ConfigurationKey configurationKey) {
        //noinspection OptionalGetWithoutIsPresent
        return configurationRepository.findById(configurationKey).get();
    }

    public List<Configuration> findAll(List<ConfigurationKey> configurationKeys) {
        return configurationRepository.findAllById(configurationKeys);
    }

    public List<Configuration> findAll() {
        return configurationRepository.findAll();
    }

    @Transactional
    public Configuration save(Configuration configuration) {
        if (ConfigurationKey.NUMBER_OF_GROUP_MEMBERS_ADVANCING == configuration.getKey()) {
            var currentTournament = tournamentService.getCurrentTournament();
            if (currentTournament != null) {
                currentTournament.setNumOfGroupAdvancing(Integer.parseInt(configuration.getValue()));
                tournamentService.save(currentTournament);
            }
        }
        return configurationRepository.save(configuration);
    }
}

