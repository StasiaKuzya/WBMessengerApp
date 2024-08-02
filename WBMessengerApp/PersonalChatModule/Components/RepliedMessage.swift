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
                    .foregroundColor(.black.opacity(0.8))
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 4)
                .fill(.wbGradientLightBlue))
    }
}

#Preview {
    RepliedMessage(text: "Test")
}
