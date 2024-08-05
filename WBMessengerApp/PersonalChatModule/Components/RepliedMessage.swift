//
//  RepliedMessage.swift
//  WBMessengerApp
//
//  Created by Анастасия on 02.08.2024.
//

import SwiftUI

struct RepliedMessage: View {
    var text: String = ""
    
    var body: some View {
            VStack(alignment: .leading, spacing: 4) {
                Text("Replying to:")
                    .font(.caption).bold()
                    .foregroundColor(.wbDefaultPurple)
                Text(text)
                    .font(.caption)
                    .foregroundColor(.wbFont)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 4)
                .fill(.wbReply)
                .background(RoundedRectangle(cornerRadius: 4)
                    .fill(.wbDarkPurple)
                    .offset(x: -4))
                    .shadow(color: .wbDisable, radius: 1)
            )
    }
}

#Preview {
    RepliedMessage(text: "Test")
}
