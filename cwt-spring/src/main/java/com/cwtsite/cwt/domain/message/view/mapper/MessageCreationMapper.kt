package com.cwtsite.cwt.domain.message.view.mapper

import com.cwtsite.cwt.domain.message.view.model.MessageCreationDto
import com.cwtsite.cwt.domain.message.entity.Message
import com.cwtsite.cwt.domain.message.entity.enumeration.MessageCategory
import com.cwtsite.cwt.domain.user.repository.entity.User

import org.springframework.stereotype.Component
import org.springframework.beans.factory.annotation.Autowired

@Component
class  MessageCreationMapper {

    fun fromDto(dto: MessageCreationDto, author: User, recipients: List<User>) = Message(
            author = author,
            body = dto.body,
            category = dto.category,
            recipients = recipients.toMutableList()
    )
}

