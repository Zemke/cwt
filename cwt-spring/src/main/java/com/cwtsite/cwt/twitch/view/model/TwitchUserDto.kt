package com.cwtsite.cwt.twitch.view.model

import com.cwtsite.cwt.domain.core.DataTransferObject
import com.cwtsite.cwt.domain.stream.entity.Channel
import com.cwtsite.cwt.domain.user.repository.entity.User
import com.fasterxml.jackson.annotation.JsonProperty


@DataTransferObject
data class TwitchUserDto(
        @JsonProperty("login") var login: String?,
        @JsonProperty("view_count") var viewCount: Long?,
        @JsonProperty("id") var id: String?,
        @JsonProperty("broadcaster_type") var broadcasterType: String?,
        @JsonProperty("type") var type: String?,
        @JsonProperty("offline_image_url") var offlineImageUrl: String?,
        @JsonProperty("profile_image_url") var profileImageUrl: String?,
        @JsonProperty("description") var description: String?,
        @JsonProperty("display_name") var displayName: String?
)

