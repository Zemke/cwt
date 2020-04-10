package com.cwtsite.cwt.core

import com.cwtsite.cwt.core.profile.Dev
import khttp.responses.Response
import org.apache.http.HttpEntity
import org.springframework.stereotype.Service
import org.springframework.web.multipart.MultipartFile
import java.io.File

@Dev
@Service
class BinaryOutboundServiceDevImpl : BinaryOutboundService {

    override fun retrieveUserPhoto(userId: Long): Response {
        throw UnsupportedOperationException("Not implemented")
    }

    override fun retrieveReplay(gameId: Long): Response {
        throw UnsupportedOperationException("Not implemented")
    }

    override fun deleteUserPhoto(userId: Long): Response {
        throw UnsupportedOperationException("Not implemented")
    }

    override fun sendUserPhoto(userId: Long, photo: MultipartFile): HttpEntity {
        throw UnsupportedOperationException("Not implemented")
    }

    override fun sendReplay(gameId: Long, replay: MultipartFile): HttpEntity {
        throw UnsupportedOperationException("Not implemented")
    }

    override fun extractGameStats(gameId: Long, extractedReplay: File): HttpEntity {
        throw UnsupportedOperationException("Not implemented")
    }
}
