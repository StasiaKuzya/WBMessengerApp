//
//  SentMessageView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 31.07.2024.
//

import SwiftUI

struct SentMessageView: View {
    var message: Message
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            Text(message.text)
            Text(message.timestamp, style: .time)
                .font(.caption)
        }
        .padding(.all, 10)
        .background(Rectangle().fill(.wbDefaultPurple))
        .foregroundStyle(.wbWhite)
        .cornerRadius(10, corners: [.topLeft, .topRight, .bottomLeft])
    }
}

#Preview {
    SentMessageView(message: Message(text: "TestTestTestTestTestTestTestTestTestTestTestTestTestTestTest", sender: "You", timestamp: Date()))
}
