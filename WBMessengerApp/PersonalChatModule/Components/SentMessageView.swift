//
//  SentMessageView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 31.07.2024.
//

import SwiftUI
import ExyteChat

struct SentMessageView: View {
    var message: Message
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            Text(message.text)
            Text(message.createdAt, style: .time)
                .font(.caption)
            if !message.attachments.isEmpty {
                ForEach(message.attachments, id: \.id) { at in
                    AsyncImage(url: at.thumbnail)
                }
            }
        }
        .padding(.all, 10)
        .background(Rectangle().fill(.wbDefaultPurple))
        .foregroundStyle(.wbWhite)
        .cornerRadius(10, corners: [.topLeft, .topRight, .bottomLeft])
    }
}

#Preview {
    SentMessageView(message: Message(id: "1", user: User(id: "1", name: "you", avatarURL: nil, isCurrentUser: true), status: .read, createdAt: Date(), text: "testtest", attachments: [], recording: nil, replyMessage: nil))
}
