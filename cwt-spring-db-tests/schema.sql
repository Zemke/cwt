-- This is the manually triggered generated DDL for the code generation of RedG.
CREATE DOMAIN TEXT AS VARCHAR;

create sequence application_seq;

create sequence comment_seq;

create sequence game_seq;

create sequence group_seq;

create sequence group_standing_seq;

create sequence hibernate_sequence;

create sequence message_seq;

create sequence playoff_game_seq;

create sequence rating_seq;

create sequence tournament_seq;

create sequence user_profile_seq;

create sequence user_seq;

create sequence user_setting_seq;

create table flyway_schema_history
(
  installed_rank integer                 not null,
  version        varchar(50),
  description    varchar(200)            not null,
  type           varchar(20)             not null,
  script         varchar(1000)           not null,
  checksum       integer,
  installed_by   varchar(100)            not null,
  installed_on   timestamp default now() not null,
  execution_time integer                 not null,
  success        boolean                 not null,
  constraint flyway_schema_history_pk
    primary key (installed_rank)
);

create index flyway_schema_history_s_idx
  on flyway_schema_history (success);

create table authority
(
  id   bigint      not null,
  name varchar(50) not null,
  constraint authority_pkey
    primary key (id)
);

create table playoff_game
(
  id    bigint not null,
  round integer,
  spot  integer,
  constraint playoff_game_pkey
    primary key (id)
);

create table replay
(
  id         bigint not null,
  extension  varchar(255),
  file       bytea,
  media_type varchar(255),
  constraint replay_pkey
    primary key (id)
);

create table "user"
(
  id                   bigint      not null,
  activated            boolean     not null,
  activation_key       varchar(20),
  created              timestamp,
  email                varchar(100),
  modified             timestamp,
  password_hash        varchar(60),
  password_legacy_hash varchar(40),
  reset_date           timestamp,
  reset_key            varchar(20),
  username             varchar(16) not null,
  country              text,
  about                text,
  constraint user__pkey
    primary key (id),
  constraint uk_ha67cvlhy4nk1prswl5gj1y0y
    unique (email),
  constraint uk_wqsqlvajcne4rlyosglqglhk
    unique (username)
);

create table configuration
(
  key       varchar(255) not null,
  modified  timestamp,
  value     text,
  author_id bigint,
  constraint configuration_pkey
    primary key (key),
  constraint fk_config_author
    foreign key (author_id) references "user"
);

create table message
(
  id        bigint not null,
  body      text,
  category  varchar(255),
  created   timestamp,
  author_id bigint,
  constraint message_pkey
    primary key (id),
  constraint fkl6haocuy24s5uajlscbmv017u
    foreign key (author_id) references "user"
);

create table message_recipient
(
  user_id    bigint not null,
  message_id bigint not null,
  constraint fkbo4o6ijw74gntl4e4lhbcn7t1
    foreign key (message_id) references "user",
  constraint fk6jae7kxus49qhvetuq06b4ib9
    foreign key (user_id) references message
);

create table page
(
  id        bigint not null,
  created   timestamp,
  modified  timestamp,
  text      text,
  title     varchar(255),
  author_id bigint,
  constraint page_pkey
    primary key (id),
  constraint fk1a52gu2ix39whlfti99cv72xh
    foreign key (author_id) references "user"
);

create table tournament
(
  id               bigint       not null,
  created          timestamp,
  open             timestamp,
  review           text,
  status           varchar(255) not null,
  bronze_winner_id bigint,
  gold_winner_id   bigint,
  host_id          bigint,
  silver_winner_id bigint,
  max_rounds       integer      not null,
  constraint tournament_pkey
    primary key (id),
  constraint fkrgl93ergbjp15gq8tiexw2s1g
    foreign key (bronze_winner_id) references "user",
  constraint fkfbxdkt2v47x992xbbs0cw9in0
    foreign key (gold_winner_id) references "user",
  constraint fk88k7wt4leenlp4xouf19tg01e
    foreign key (host_id) references "user",
  constraint fkx1bywy6rqobnlria56ijpp1q
    foreign key (silver_winner_id) references "user"
);

create table "group"
(
  id            bigint not null,
  label         varchar(255),
  tournament_id bigint,
  constraint group_pkey
    primary key (id),
  constraint fk4oahq4ka610ap6v99wegar51h
    foreign key (tournament_id) references tournament
);

create table application
(
  id            bigint not null,
  created       timestamp,
  revoked       boolean,
  applicant_id  bigint,
  tournament_id bigint,
  constraint application_pkey
    primary key (id),
  constraint fkqkrbk3cglyw1k3ie2fdnbpbfd
    foreign key (applicant_id) references "user",
  constraint fk2i6j1qa1y0p58npfnesahidyp
    foreign key (tournament_id) references tournament
);

create table game
(
  id            bigint not null,
  created       timestamp,
  downloads     integer,
  modified      timestamp,
  score_away    integer,
  score_home    integer,
  tech_win      boolean,
  away_user_id  bigint,
  group_id      bigint,
  home_user_id  bigint,
  playoff_id    bigint,
  replay_id     bigint,
  reporter_id   bigint,
  tournament_id bigint,
  constraint game_pkey
    primary key (id),
  constraint uk_et35lhq05h50h8p5nsokcjqst
    unique (playoff_id),
  constraint fkavuvbg81kyepwonnj0ceww8kj
    foreign key (away_user_id) references "user",
  constraint fk62h229fd2s82u9cqyyr6bltq2
    foreign key (group_id) references "group",
  constraint fkd1a70shd6elggerrpibo1suaw
    foreign key (home_user_id) references "user",
  constraint fk3j458b4v1nxcttqpfxexubl66
    foreign key (playoff_id) references playoff_game,
  constraint fk91gsa4ll1k3n8w3ovrwwua1fi
    foreign key (replay_id) references replay,
  constraint fks1t49b5paaory7xekqnch8ekq
    foreign key (reporter_id) references "user",
  constraint fk2xfdbv4n193efuyajlqh0vs6j
    foreign key (tournament_id) references tournament
);

create table comment
(
  id        bigint not null,
  body      text   not null,
  created   timestamp,
  deleted   boolean,
  modified  timestamp,
  author_id bigint,
  game_id   bigint,
  constraint comment_pkey
    primary key (id),
  constraint fkeygnqcngb7dixfa8lngm5h4f5
    foreign key (author_id) references "user",
  constraint fkdnsshxpxsyim4eglkpc9je1ol
    foreign key (game_id) references game
);

create table group_standing
(
  id          bigint not null,
  game_ratio  integer,
  games       integer,
  points      integer,
  round_ratio integer,
  group_id    bigint,
  user_id     bigint,
  constraint group_standing_pkey
    primary key (id),
  constraint fkq1g7isdnrdvs7j9o67efu2bp1
    foreign key (group_id) references "group",
  constraint fk8c7vqf3fl34f4sii2jblinikx
    foreign key (user_id) references "user"
);

create table rating
(
  id      bigint not null,
  type    varchar(255),
  game_id bigint,
  user_id bigint,
  constraint rating_pkey
    primary key (id),
  constraint fkhotxgrgtrin4xcto6n1j4a946
    foreign key (game_id) references game,
  constraint fkjxar2wvjrmsrtod3l1qo00gg9
    foreign key (user_id) references "user"
);

create table rating_result
(
  id        bigint not null,
  darkside  integer,
  dislikes  integer,
  lightside integer,
  likes     integer,
  game_id   bigint,
  constraint rating_result_pkey
    primary key (id),
  constraint uk_fsrltpxqa34qwiouassa1vk26
    unique (game_id),
  constraint fkgfmf4h0ad9xwsqtwj37ua57rn
    foreign key (game_id) references game
);

create table tournament_moderator
(
  tournaments_id bigint not null,
  moderators_id  bigint not null,
  constraint tournament_moderator_pkey
    primary key (tournaments_id, moderators_id),
  constraint fkqhmsieieob4v5mdmljrtc62xp
    foreign key (moderators_id) references "user",
  constraint fkjpo17fup9aehl7t4br4y6rpew
    foreign key (tournaments_id) references tournament
);

create table user_authority
(
  user_id      bigint not null,
  authority_id bigint not null,
  constraint fkgvxjs381k6f48d5d2yi11uh89
    foreign key (authority_id) references authority,
  constraint fkio2xcw9ogcqbasp25n5vttxrf
    foreign key (user_id) references "user"
);
