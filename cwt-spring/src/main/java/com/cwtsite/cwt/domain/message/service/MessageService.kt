package com.cwtsite.cwt.domain.message.service

import com.cwtsite.cwt.domain.message.entity.Message
import com.cwtsite.cwt.domain.message.entity.enumeration.MessageCategory
import com.cwtsite.cwt.domain.user.repository.entity.User
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Component
import org.springframework.transaction.annotation.Propagation
import org.springframework.transaction.annotation.Transactional
import java.sql.Timestamp
import kotlin.math.min

@Component
class MessageService @Autowired
constructor(private val messageRepository: MessageRepository) {

    fun findNewMessages(after: Timestamp, size: Int, user: User?,
                        categories: List<MessageCategory> = MessageCategory.values().toList()): List<Message> {
        val result = messageRepository.findNewByAuthorOrRecipientsInOrCategoryInOrderByCreatedDesc(user, categories, after)
        return result.subList(0, min(size, result.size))
    }

    fun findOldMessages(before: Timestamp, size: Int, user: User?,
                        categories: List<MessageCategory> = MessageCategory.values().toList()): List<Message> {
        val result = messageRepository.findOldByAuthorOrRecipientsInOrCategoryInOrderByCreatedDesc(user, categories, before)
        return result.subList(0, min(size, result.size))
    }

    fun save(message: Message): Message {
        return messageRepository.save(message)
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    fun publishNews(type: MessageNewsType, author: User, vararg data: Any?): Message =
            messageRepository.save(Message(category = MessageCategory.NEWS, author = author, newsType = type, body = data.joinToString(separator = ",")))

    fun deleteMessage(id: Long) {
        messageRepository.deleteById(id)
    }

    fun findMessagesForAdminCreatedBefore(after: Timestamp, size: Int): List<Message> {
        val result = messageRepository.findAllByCreatedBeforeOrderByCreatedDesc(after)
        return result.subList(0, min(size, result.size))
    }

    fun findMessagesForAdminCreatedAfter(after: Timestamp, size: Int): List<Message> {
        val result = messageRepository.findAllByCreatedAfterOrderByCreatedDesc(after)
        return result.subList(0, min(size, result.size))
    }
}
