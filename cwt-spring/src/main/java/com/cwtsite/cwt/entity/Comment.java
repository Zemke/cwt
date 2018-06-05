package com.cwtsite.cwt.entity;

import com.cwtsite.cwt.domain.game.entity.Game;
import com.cwtsite.cwt.domain.user.repository.entity.User;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Objects;

/**
 * A Comment.
 */
@Entity
@Table(name = "comment")
@SequenceGenerator(name = "comment_seq", sequenceName = "comment_seq", initialValue = 1466, allocationSize = 1)
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "comment_seq")
    private Long id;

    @NotNull
    @Column(name = "body", nullable = false, columnDefinition = "text")
    private String body;

    @Column(name = "deleted")
    private Boolean deleted;

    @Column(name = "created")
    @CreationTimestamp
    private Timestamp created;

    @Column(name = "modified")
    @UpdateTimestamp
    private Timestamp modified;

    @ManyToOne
    private User author;

    @JsonIgnore
    @ManyToOne
    @JoinColumn
    private Game game;

    protected Comment() {
    }

    public Comment(String body, User author, Game game) {
        this.body = body;
        this.author = author;
        this.game = game;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Comment body(String body) {
        this.body = body;
        return this;
    }

    public Boolean isDeleted() {
        return deleted;
    }

    public Comment deleted(Boolean deleted) {
        this.deleted = deleted;
        return this;
    }

    public void setDeleted(Boolean deleted) {
        this.deleted = deleted;
    }

    public Timestamp getCreated() {
        return created;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    public Comment created(Timestamp created) {
        this.created = created;
        return this;
    }

    public Timestamp getModified() {
        return modified;
    }

    public void setModified(Timestamp modified) {
        this.modified = modified;
    }

    public Comment modified(Timestamp modified) {
        this.modified = modified;
        return this;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User user) {
        this.author = user;
    }

    public Comment author(User user) {
        this.author = user;
        return this;
    }

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    public Comment game(Game game) {
        this.game = game;
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Comment comment = (Comment) o;
        if (comment.id == null || id == null) {
            return false;
        }
        return Objects.equals(id, comment.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", body='" + body + "'" +
                ", deleted='" + deleted + "'" +
                ", created='" + created + "'" +
                ", modified='" + modified + "'" +
                '}';
    }
}
