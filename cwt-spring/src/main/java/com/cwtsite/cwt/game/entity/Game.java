package com.cwtsite.cwt.game.entity;

import com.cwtsite.cwt.entity.Comment;
import com.cwtsite.cwt.group.entity.Group;
import com.cwtsite.cwt.tournament.entity.Tournament;
import com.cwtsite.cwt.user.repository.entity.User;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

/**
 * A Game.
 */
@Entity
@Table(name = "game")
public class Game implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column(name = "score_home")
    private Integer scoreHome;

    @Column(name = "score_away")
    private Integer scoreAway;

    @Column(name = "tech_win")
    private Boolean techWin = false;

    @Column(name = "downloads")
    private Integer downloads;

    @Column(name = "created")
    private LocalDate created;

    @Column(name = "modified")
    private LocalDate modified;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(unique = true)
    private PlayoffGame playoff;

    @ManyToOne
    private Tournament tournament;

    @ManyToOne
    private Group group;

    @ManyToOne
    private User homeUser;

    @ManyToOne
    private User awayUser;

    @ManyToOne
    private User reporter;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "game")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Rating> ratings;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "game")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Comment> comments;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getScoreHome() {
        return scoreHome;
    }

    public void setScoreHome(Integer scoreHome) {
        this.scoreHome = scoreHome;
    }

    public Game scoreHome(Integer scoreHome) {
        this.scoreHome = scoreHome;
        return this;
    }

    public Integer getScoreAway() {
        return scoreAway;
    }

    public void setScoreAway(Integer scoreAway) {
        this.scoreAway = scoreAway;
    }

    public Game scoreAway(Integer scoreAway) {
        this.scoreAway = scoreAway;
        return this;
    }

    public Boolean isTechWin() {
        return techWin;
    }

    public Game techWin(Boolean techWin) {
        this.techWin = techWin;
        return this;
    }

    public void setTechWin(Boolean techWin) {
        this.techWin = techWin;
    }

    public Integer getDownloads() {
        return downloads;
    }

    public void setDownloads(Integer downloads) {
        this.downloads = downloads;
    }

    public Game downloads(Integer downloads) {
        this.downloads = downloads;
        return this;
    }

    public LocalDate getCreated() {
        return created;
    }

    public void setCreated(LocalDate created) {
        this.created = created;
    }

    public Game created(LocalDate created) {
        this.created = created;
        return this;
    }

    public LocalDate getModified() {
        return modified;
    }

    public void setModified(LocalDate modified) {
        this.modified = modified;
    }

    public Game modified(LocalDate modified) {
        this.modified = modified;
        return this;
    }

    public PlayoffGame getPlayoff() {
        return playoff;
    }

    public void setPlayoff(PlayoffGame playoffGame) {
        this.playoff = playoffGame;
    }

    public Game playoff(PlayoffGame playoffGame) {
        this.playoff = playoffGame;
        return this;
    }

    public Tournament getTournament() {
        return tournament;
    }

    public void setTournament(Tournament tournament) {
        this.tournament = tournament;
    }

    public Game tournament(Tournament tournament) {
        this.tournament = tournament;
        return this;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public Game group(Group group) {
        this.group = group;
        return this;
    }

    public User getHomeUser() {
        return homeUser;
    }

    public void setHomeUser(User user) {
        this.homeUser = user;
    }

    public Game homeUser(User user) {
        this.homeUser = user;
        return this;
    }

    public User getAwayUser() {
        return awayUser;
    }

    public void setAwayUser(User user) {
        this.awayUser = user;
    }

    public Game awayUser(User user) {
        this.awayUser = user;
        return this;
    }

    public User getReporter() {
        return reporter;
    }

    public void setReporter(User user) {
        this.reporter = user;
    }

    public Game reporter(User user) {
        this.reporter = user;
        return this;
    }

    public List<Rating> getRatings() {
        return ratings;
    }

    public void setRatings(List<Rating> ratings) {
        this.ratings = ratings;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Game game = (Game) o;
        if (game.id == null || id == null) {
            return false;
        }
        return Objects.equals(id, game.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }

    @Override
    public String toString() {
        return "Game{" +
                "id=" + id +
                ", scoreHome='" + scoreHome + "'" +
                ", scoreAway='" + scoreAway + "'" +
                ", techWin='" + techWin + "'" +
                ", downloads='" + downloads + "'" +
                ", created='" + created + "'" +
                ", modified='" + modified + "'" +
                '}';
    }
}
