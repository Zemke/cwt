package com.cwtsite.cwt.domain.user.repository

import com.cwtsite.cwt.domain.user.repository.entity.User
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface UserRepository : JpaRepository<User, Long> {
    fun findByUsername(username: String): User
    fun findByEmailEqualsOrUsernameEquals(email: String, username: String): User
    fun findByUsernameContaining(username: String): List<User>
}