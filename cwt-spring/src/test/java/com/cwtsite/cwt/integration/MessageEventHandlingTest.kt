package com.cwtsite.cwt.integration

import com.cwtsite.cwt.core.event.SseEmitterFactory
import com.cwtsite.cwt.core.event.SseEmitterWrapper
import com.cwtsite.cwt.domain.message.entity.Message
import com.cwtsite.cwt.domain.message.entity.enumeration.MessageCategory
import com.cwtsite.cwt.domain.message.service.MessageService
import com.cwtsite.cwt.domain.user.repository.entity.User
import com.cwtsite.cwt.domain.user.service.AuthService
import com.cwtsite.cwt.domain.user.service.UserService
import com.cwtsite.cwt.test.MockitoUtils.anyObject
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.MethodOrderer
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.TestMethodOrder
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.Mock
import org.mockito.Mockito.*
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.boot.test.mock.mockito.MockBean
import org.springframework.http.MediaType
import org.springframework.test.annotation.DirtiesContext
import org.springframework.test.context.junit.jupiter.SpringExtension
import org.springframework.test.web.servlet.MockMvc
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get
import org.springframework.test.web.servlet.result.MockMvcResultHandlers.print
import org.springframework.test.web.servlet.result.MockMvcResultMatchers.status
import java.sql.Timestamp

@ExtendWith(SpringExtension::class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@AutoConfigureMockMvc
@EmbeddedPostgres
@DirtiesContext
@TestMethodOrder(MethodOrderer.OrderAnnotation::class)
class MessageEventHandlingTest {

    @Autowired private lateinit var mockMvc: MockMvc
    @Autowired private lateinit var messageService: MessageService
    @Autowired private lateinit var userService: UserService

    @MockBean private lateinit var authService: AuthService
    @MockBean private lateinit var sseEmitterFactory: SseEmitterFactory

    @Mock private lateinit var sseEmitter: SseEmitterWrapper

    companion object {
        private var user: User? = null
    }

    @BeforeEach
    fun setup() {
        `when`(sseEmitterFactory.createInstance()).thenReturn(sseEmitter)
        if (user == null) user = userService.saveUser(User(username = "name", email = "master@example.com"))
        `when`(authService.authUser(anyObject())).thenReturn(user)
    }

    @Test
    fun handle() {
        mockMvc
                .perform(get("/api/message/listen").contentType(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isOk)
        val message = messageService.save(Message(
                body = "Everybody needs to know this!",
                author = user!!,
                category = MessageCategory.SHOUTBOX,
                created = Timestamp(1605483348499)))
        verify(sseEmitter).send("EVENT", message)
    }

    @Test
    fun doNotPublishPrivateMessage() {
        mockMvc
                .perform(get("/api/message/listen").contentType(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isOk)
        val author = userService.saveUser(User(username = "Author", email = "author@example.com"))
        val recipient = userService.saveUser(User(username = "HelloUser", email = "hello@example.com"))
        val message = Message(
                body = "Everybody needs to know this!",
                author = author,
                category = MessageCategory.PRIVATE,
                recipients = mutableListOf(recipient),
                created = Timestamp(1605483348499)
        )
        messageService.save(message)
        verify(sseEmitter, never()).send(anyObject(), anyObject())
    }
}
