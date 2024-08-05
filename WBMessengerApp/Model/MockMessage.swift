//
//  Message.swift
//  WBMessengerApp
//
//  Created by Анастасия on 31.07.2024.
//

import Foundation
import ExyteChat

struct MockMessage {
    let uid: String
    let sender: MockUser
    let createdAt: Date
    var status: Message.Status?

    let text: String
    let images: [MockImage]
    let videos: [MockVideo]
    let recording: Recording?
    let replyMessage: ReplyMessage?
}

extension MockMessage {
    func toChatMessage() -> ExyteChat.Message {
        ExyteChat.Message(
            id: uid,
            user: sender.toChatUser(),
            status: status,
            createdAt: createdAt,
            text: text,
            attachments: images.map { $0.toChatAttachment() } + videos.map { $0.toChatAttachment() },
            recording: recording,
            replyMessage: replyMessage
        )
    }
}

struct MockImage {
    let id: String
    let thumbnail: URL
    let full: URL

    func toChatAttachment() -> Attachment {
        Attachment(
            id: id,
            thumbnail: thumbnail,
            full: full,
            type: .image
        )
    }
}

struct MockVideo {
    let id: String
    let thumbnail: URL
    let full: URL

    func toChatAttachment() -> Attachment {
        Attachment(
            id: id,
            thumbnail: thumbnail,
            full: full,
            type: .video
        )
    }
}
