//
//  EmojiCellView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 02.07.2024.
//

import SwiftUI

struct EmojiCellView: View {
    let emoji: String
    let size1: CGSize
    let size2: CGSize
    let size3: CGSize

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .frame(width: size1.width, height: size1.height)
                        .foregroundStyle(.black)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .frame(width: size2.width, height: size2.height)
                        .foregroundStyle(.green)
                }
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: size3.width, height: size3.height)
                    .foregroundStyle(.pink).opacity(0.7)
            }
            
            Text(emoji)
                .font(.largeTitle)
                .opacity(0.5)
        }
        .frame(height: size1.height + size3.height + 20)
        .padding(.horizontal, 20)
        .foregroundStyle(.gray)
        .background(
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [1]))
            
        )
    }
}

#Preview {
    EmojiCellView(emoji: "🤩",
                  size1: CGSize(width: 250, height: 70),
                  size2: CGSize(width: 50, height: 70),
                  size3: CGSize(width: 300, height: 30)
    )
}
