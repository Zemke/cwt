package com.cwtsite.cwt.domain.schedule.view.model

import com.cwtsite.cwt.domain.core.DataTransferObject
import com.cwtsite.cwt.domain.schedule.entity.Schedule
import com.cwtsite.cwt.domain.stream.view.model.ChannelDto
import com.cwtsite.cwt.domain.user.view.model.UserMinimalDto
import java.time.Instant

@DataTransferObject
data class ScheduleDto(
        val id: Long,
        val homeUser: UserMinimalDto,
        val awayUser: UserMinimalDto,
        val appointment: Instant,
        val author: UserMinimalDto,
        val streams: List<ChannelDto>,
        val created: Instant
) 

