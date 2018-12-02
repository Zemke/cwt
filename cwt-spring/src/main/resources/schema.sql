CREATE DOMAIN TEXT AS VARCHAR;

create sequence application_seq start with 102 increment by 1;
create sequence comment_seq start with 1466 increment by 1;
create sequence game_seq start with 1219 increment by 1;
create sequence group_seq start with 121 increment by 1;
create sequence group_standing_seq start with 486 increment by 1;
create sequence hibernate_sequence start with 1 increment by 1;
create sequence message_seq start with 7399 increment by 1;
create sequence playoff_game_seq start with 261 increment by 1;
create sequence rating_seq start with 1103 increment by 1;
create sequence tournament_seq start with 16 increment by 1;
create sequence user_profile_seq start with 1332 increment by 1;
create sequence user_seq start with 1332 increment by 1;
create sequence user_setting_seq start with 1332 increment by 1;
create table "group" (id bigint not null, label varchar(255), tournament_id bigint, primary key (id));
create table application (id bigint not null, created timestamp, revoked boolean, applicant_id bigint, tournament_id bigint, primary key (id));
create table authority (id bigint not null, name varchar(50) not null, primary key (id));
create table comment (id bigint not null, body text not null, created timestamp, deleted boolean, modified timestamp, author_id bigint, game_id bigint, primary key (id));
create table configuration (key varchar(255) not null, modified timestamp, value text, author_id bigint, primary key (key));
create table game (id bigint not null, created timestamp, downloads integer, modified timestamp, score_away integer, score_home integer, tech_win boolean, away_user_id bigint, group_id bigint, home_user_id bigint, playoff_id bigint, replay_id bigint, reporter_id bigint, tournament_id bigint, primary key (id));
create table group_standing (id bigint not null, game_ratio integer, games integer, points integer, round_ratio integer, group_id bigint, user_id bigint, primary key (id));
create table message (id bigint not null, body text, category varchar(255), created timestamp, author_id bigint, primary key (id));
create table message_recipient (user_id bigint not null, message_id bigint not null);
create table page (id bigint not null, created timestamp, modified timestamp, text text, title varchar(255), author_id bigint, primary key (id));
create table playoff_game (id bigint not null, round integer, spot integer, primary key (id));
create table rating (id bigint not null, type varchar(255), game_id bigint, user_id bigint, primary key (id));
create table rating_result (id bigint not null, darkside integer, dislikes integer, lightside integer, likes integer, game_id bigint, primary key (id));
create table replay (id bigint not null, extension varchar(255), file bytea, media_type varchar(255), primary key (id));
create table tournament (id bigint not null, created timestamp, open timestamp, review text, status varchar(255) not null, bronze_winner_id bigint, gold_winner_id bigint, host_id bigint, silver_winner_id bigint, primary key (id));
create table tournament_moderator (tournaments_id bigint not null, moderators_id bigint not null, primary key (tournaments_id, moderators_id));
create table user_ (id bigint not null, activated boolean not null, activation_key varchar(20), created timestamp, email varchar(100), modified timestamp, password_hash varchar(60), password_legacy_hash varchar(40), reset_date timestamp, reset_key varchar(20), username varchar(16) not null, primary key (id));
create table user_authority (user_id bigint not null, authority_id bigint not null);
create table user_profile (id bigint not null, about text, clan varchar(255), country varchar(255), email varchar(255), facebook varchar(255), modified timestamp, skype varchar(255), twitter varchar(255), user_id bigint, primary key (id));
create table user_setting (id bigint not null, hide_email boolean, hide_profile boolean, modified timestamp, user_id bigint, primary key (id));
alter table game add constraint UK_et35lhq05h50h8p5nsokcjqst unique (playoff_id);
alter table rating_result add constraint UK_fsrltpxqa34qwiouassa1vk26 unique (game_id);
alter table user_ add constraint UK_ha67cvlhy4nk1prswl5gj1y0y unique (email);
alter table user_ add constraint UK_wqsqlvajcne4rlyosglqglhk unique (username);
alter table user_profile add constraint UK_ebc21hy5j7scdvcjt0jy6xxrv unique (user_id);
alter table user_setting add constraint UK_aq5q998x4b33hm6c0m6h6c6ox unique (user_id);
alter table "group" add constraint FK4oahq4ka610ap6v99wegar51h foreign key (tournament_id) references tournament;
alter table application add constraint FKqkrbk3cglyw1k3ie2fdnbpbfd foreign key (applicant_id) references user_;
alter table application add constraint FK2i6j1qa1y0p58npfnesahidyp foreign key (tournament_id) references tournament;
alter table comment add constraint FKeygnqcngb7dixfa8lngm5h4f5 foreign key (author_id) references user_;
alter table comment add constraint FKdnsshxpxsyim4eglkpc9je1ol foreign key (game_id) references game;
alter table configuration add constraint fk_config_author foreign key (author_id) references user_;
alter table game add constraint FKavuvbg81kyepwonnj0ceww8kj foreign key (away_user_id) references user_;
alter table game add constraint FK62h229fd2s82u9cqyyr6bltq2 foreign key (group_id) references "group";
alter table game add constraint FKd1a70shd6elggerrpibo1suaw foreign key (home_user_id) references user_;
alter table game add constraint FK3j458b4v1nxcttqpfxexubl66 foreign key (playoff_id) references playoff_game;
alter table game add constraint FK91gsa4ll1k3n8w3ovrwwua1fi foreign key (replay_id) references replay;
alter table game add constraint FKs1t49b5paaory7xekqnch8ekq foreign key (reporter_id) references user_;
alter table game add constraint FK2xfdbv4n193efuyajlqh0vs6j foreign key (tournament_id) references tournament;
alter table group_standing add constraint FKq1g7isdnrdvs7j9o67efu2bp1 foreign key (group_id) references "group";
alter table group_standing add constraint FK8c7vqf3fl34f4sii2jblinikx foreign key (user_id) references user_;
alter table message add constraint FKl6haocuy24s5uajlscbmv017u foreign key (author_id) references user_;
alter table message_recipient add constraint FKbo4o6ijw74gntl4e4lhbcn7t1 foreign key (message_id) references user_;
alter table message_recipient add constraint FK6jae7kxus49qhvetuq06b4ib9 foreign key (user_id) references message;
alter table page add constraint FK1a52gu2ix39whlfti99cv72xh foreign key (author_id) references user_;
alter table rating add constraint FKhotxgrgtrin4xcto6n1j4a946 foreign key (game_id) references game;
alter table rating add constraint FKjxar2wvjrmsrtod3l1qo00gg9 foreign key (user_id) references user_;
alter table rating_result add constraint FKgfmf4h0ad9xwsqtwj37ua57rn foreign key (game_id) references game;
alter table tournament add constraint FKrgl93ergbjp15gq8tiexw2s1g foreign key (bronze_winner_id) references user_;
alter table tournament add constraint FKfbxdkt2v47x992xbbs0cw9in0 foreign key (gold_winner_id) references user_;
alter table tournament add constraint FK88k7wt4leenlp4xouf19tg01e foreign key (host_id) references user_;
alter table tournament add constraint FKx1bywy6rqobnlria56ijpp1q foreign key (silver_winner_id) references user_;
alter table tournament_moderator add constraint FKqhmsieieob4v5mdmljrtc62xp foreign key (moderators_id) references user_;
alter table tournament_moderator add constraint FKjpo17fup9aehl7t4br4y6rpew foreign key (tournaments_id) references tournament;
alter table user_authority add constraint FKgvxjs381k6f48d5d2yi11uh89 foreign key (authority_id) references authority;
alter table user_authority add constraint FKio2xcw9ogcqbasp25n5vttxrf foreign key (user_id) references user_;
alter table user_profile add constraint FK5kyn4pw0t8nuix619fha4cjss foreign key (user_id) references user_;
alter table user_setting add constraint FKlq80s6ksgbgsm6qxr5xkqpob foreign key (user_id) references user_;
