INSERT INTO authority (id, name) VALUES (40, 'ROLE_USER');
INSERT INTO authority (id, name) VALUES (41, 'ROLE_ADMIN');
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (1, true, null, '1@1', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Bytor');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (1, 40);
INSERT INTO public.user_authority (user_id, authority_id) VALUES (1, 41);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (1, null, null, null, null, null, null, null, null, 1);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (1, false, false, 1);
INSERT INTO public.tournament (id, created, open, review, status, bronze_winner_id, gold_winner_id, host_id, silver_winner_id) VALUES (1, NULL, NULL, NULL, 'OPEN', NULL, NULL, 1, NULL);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (1, null, null, 1, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (2, true, null, '2@2', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'khamski');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (2, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (2, null, null, null, null, null, null, null, null, 2);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (2, false, false, 2);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (2, null, null, 2, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (3, true, null, '3@3', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'zoky');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (3, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (3, null, null, null, null, null, null, null, null, 3);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (3, false, false, 3);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (3, null, null, 3, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (4, true, null, '4@4', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Koras');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (4, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (4, null, null, null, null, null, null, null, null, 4);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (4, false, false, 4);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (4, null, null, 4, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (5, true, null, '5@5', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Tade');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (5, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (5, null, null, null, null, null, null, null, null, 5);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (5, false, false, 5);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (5, null, null, 5, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (6, true, null, '6@6', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Fantomas');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (6, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (6, null, null, null, null, null, null, null, null, 6);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (6, false, false, 6);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (6, null, null, 6, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (7, true, null, '7@7', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'viks');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (7, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (7, null, null, null, null, null, null, null, null, 7);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (7, false, false, 7);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (7, null, null, 7, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (8, true, null, '8@8', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Johnmir');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (8, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (8, null, null, null, null, null, null, null, null, 8);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (8, false, false, 8);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (8, null, null, 8, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (9, true, null, '9@9', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Kayz');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (9, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (9, null, null, null, null, null, null, null, null, 9);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (9, false, false, 9);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (9, null, null, 9, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (10, true, null, '10@10', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'kilobyte');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (10, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (10, null, null, null, null, null, null, null, null, 10);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (10, false, false, 10);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (10, null, null, 10, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (11, true, null, '11@11', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'WorldMaster');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (11, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (11, null, null, null, null, null, null, null, null, 11);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (11, false, false, 11);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (11, null, null, 11, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (12, true, null, '12@12', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'FaD');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (12, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (12, null, null, null, null, null, null, null, null, 12);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (12, false, false, 12);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (12, null, null, 12, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (13, true, null, '13@13', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'nickynick');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (13, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (13, null, null, null, null, null, null, null, null, 13);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (13, false, false, 13);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (13, null, null, 13, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (14, true, null, '14@14', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Tomek');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (14, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (14, null, null, null, null, null, null, null, null, 14);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (14, false, false, 14);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (14, null, null, 14, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (15, true, null, '15@15', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'MrTPenguin');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (15, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (15, null, null, null, null, null, null, null, null, 15);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (15, false, false, 15);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (15, null, null, 15, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (16, true, null, '16@16', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Gopnick');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (16, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (16, null, null, null, null, null, null, null, null, 16);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (16, false, false, 16);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (16, null, null, 16, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (17, true, null, '17@17', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'chuvash');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (17, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (17, null, null, null, null, null, null, null, null, 17);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (17, false, false, 17);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (17, null, null, 17, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (18, true, null, '18@18', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Joschi');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (18, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (18, null, null, null, null, null, null, null, null, 18);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (18, false, false, 18);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (18, null, null, 18, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (19, true, null, '19@19', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Crespo');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (19, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (19, null, null, null, null, null, null, null, null, 19);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (19, false, false, 19);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (19, null, null, 19, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (20, true, null, '20@20', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Dario');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (20, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (20, null, null, null, null, null, null, null, null, 20);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (20, false, false, 20);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (20, null, null, 20, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (21, true, null, '21@21', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Jigsaw');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (21, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (21, null, null, null, null, null, null, null, null, 21);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (21, false, false, 21);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (21, null, null, 21, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (22, true, null, '22@22', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Mablak');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (22, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (22, null, null, null, null, null, null, null, null, 22);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (22, false, false, 22);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (22, null, null, 22, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (23, true, null, '23@23', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'DarKxXxLorD');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (23, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (23, null, null, null, null, null, null, null, null, 23);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (23, false, false, 23);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (23, null, null, 23, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (24, true, null, '24@24', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Ivo');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (24, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (24, null, null, null, null, null, null, null, null, 24);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (24, false, false, 24);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (24, null, null, 24, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (25, true, null, '25@25', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Zolodu');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (25, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (25, null, null, null, null, null, null, null, null, 25);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (25, false, false, 25);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (25, null, null, 25, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (26, true, null, '26@26', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Random00');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (26, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (26, null, null, null, null, null, null, null, null, 26);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (26, false, false, 26);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (26, null, null, 26, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (27, true, null, '27@27', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'NormalPRO');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (27, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (27, null, null, null, null, null, null, null, null, 27);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (27, false, false, 27);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (27, null, null, 27, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (28, true, null, '28@28', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Chicken23');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (28, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (28, null, null, null, null, null, null, null, null, 28);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (28, false, false, 28);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (28, null, null, 28, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (29, true, null, '29@29', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Javito');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (29, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (29, null, null, null, null, null, null, null, null, 29);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (29, false, false, 29);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (29, null, null, 29, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (30, true, null, '30@30', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Konrad');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (30, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (30, null, null, null, null, null, null, null, null, 30);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (30, false, false, 30);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (30, null, null, 30, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (31, true, null, '31@31', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'Antares');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (31, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (31, null, null, null, null, null, null, null, null, 31);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (31, false, false, 31);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (31, null, null, 31, 1);
INSERT INTO public.user_ (id, activated, activation_key, email, password_hash, password_legacy_hash, reset_date, reset_key, username) VALUES (32, true, null, '32@32', '$2a$10$bjMYWhe0CdANS4aD0k0r8OUMLDv2wrCg3M2WLsjwU.VwYHzyCLcH2', null, null, null, 'lacoste');
INSERT INTO public.user_authority (user_id, authority_id) VALUES (32, 40);
INSERT INTO public.user_profile (id, about, clan, country, email, facebook, modified, skype, twitter, user_id) VALUES (32, null, null, null, null, null, null, null, null, 32);
INSERT INTO user_setting (id, hide_email, hide_profile, user_id) VALUES (32, false, false, 32);
INSERT INTO public.application (id, created, revoked, applicant_id, tournament_id) VALUES (32, null, null, 32, 1);

INSERT INTO configuration (created, key, value, author_id) VALUES (NULL, 'RULES', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac mauris non nisi iaculis commodo. Sed convallis bibendum dui nec posuere. Phasellus quis ante ut orci vulputate semper vitae lobortis odio. Mauris vel orci et nulla euismod eleifend. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla faucibus nisl sit amet ex ultricies eleifend. Suspendisse a leo fringilla ipsum venenatis posuere. Fusce placerat nunc sed fermentum pulvinar. Mauris eu quam ut urna laoreet varius sit amet non ex. Duis felis lacus, auctor accumsan cursus non, volutpat et nisl. Sed in turpis interdum augue ultricies luctus. Donec ac mattis arcu, eget lobortis massa.', 1);
INSERT INTO configuration (created, key, value, author_id) VALUES (NULL, 'USERS_PER_GROUP', 4, 1);
INSERT INTO configuration (created, key, value, author_id) VALUES (NULL, 'NUMBER_OF_GROUPS', 2, 1);

INSERT INTO public."group" (id, label, tournament_id) VALUES (10, 'A', 1);
INSERT INTO public."group" (id, label, tournament_id) VALUES (11, 'B', 1);

INSERT INTO public.group_standing (id, game_ratio, games, points, round_ratio, group_id, user_id) VALUES (20, 0, 0, 0, 0, 10, 2);
INSERT INTO public.group_standing (id, game_ratio, games, points, round_ratio, group_id, user_id) VALUES (21, 0, 0, 0, 0, 10, 3);
INSERT INTO public.group_standing (id, game_ratio, games, points, round_ratio, group_id, user_id) VALUES (22, 0, 0, 0, 0, 10, 4);
INSERT INTO public.group_standing (id, game_ratio, games, points, round_ratio, group_id, user_id) VALUES (23, 0, 0, 0, 0, 10, 7);
INSERT INTO public.group_standing (id, game_ratio, games, points, round_ratio, group_id, user_id) VALUES (24, 0, 0, 0, 0, 10, 9);
INSERT INTO public.group_standing (id, game_ratio, games, points, round_ratio, group_id, user_id) VALUES (25, 0, 0, 0, 0, 11, 10);
INSERT INTO public.group_standing (id, game_ratio, games, points, round_ratio, group_id, user_id) VALUES (26, 0, 0, 0, 0, 11, 13);
INSERT INTO public.group_standing (id, game_ratio, games, points, round_ratio, group_id, user_id) VALUES (27, 0, 0, 0, 0, 11, 14);
INSERT INTO public.group_standing (id, game_ratio, games, points, round_ratio, group_id, user_id) VALUES (28, 0, 0, 0, 0, 11, 16);
INSERT INTO public.group_standing (id, game_ratio, games, points, round_ratio, group_id, user_id) VALUES (29, 0, 0, 0, 0, 11, 22);
