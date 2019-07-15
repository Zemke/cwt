package com.cwtsite.cwt.domain.user.repository.entity

import javax.persistence.*

@Entity
data class Photo(

        @Id
        @GeneratedValue(strategy = GenerationType.SEQUENCE)
        var id: Long? = null,

        @Column(nullable = false)
        var file: ByteArray,

        @Column(nullable = false)
        var mediaType: String,

        @Column(nullable = false)
        var extension: String
) {

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as Photo

        if (id != other.id) return false

        return true
    }

    override fun hashCode(): Int {
        return id?.hashCode() ?: 0
    }
}