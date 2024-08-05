//
//  RecievedMessageView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 31.07.2024.
//

import SwiftUI
import ExyteChat

struct RecievedMessageView: View {
    var message: Message
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(message.text)
            Text(message.createdAt, style: .time)
                .font(.caption)
        }
    }
}

#Preview {
    RecievedMessageView(message: Message(id: "1", user: User(id: "1", name: "you", avatarURL: nil, isCurrentUser: true), status: .read, createdAt: Date(), text: "testtest", attachments: [], recording: nil, replyMessage: nil))
}
