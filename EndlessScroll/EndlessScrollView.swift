//
//  EndlessScrollView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 02.07.2024.
//

import SwiftUI

struct EndlessScrollView: View {
    @State private var items: [EmojiItem] = (1...20).map { _ in EmojiItem.randomItem() }
    
    var body: some View {
        ZStack {
            Color.purple.opacity(0.5).ignoresSafeArea()
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(items) { item in
                        EmojiCellView(emoji: item.emoji, size1: item.size1, size2: item.size2, size3: item.size3)
                            .onAppear {
                                if item == items.last {
                                    loadMoreItems()
                                }
                            }
                    }
                }
            }
        }
    }
    
    private func loadMoreItems() {
        let newItems = (1...20).map { _ in EmojiItem.randomItem() }
        items.append(contentsOf: newItems)
    }
}

#Preview {
    EndlessScrollView()
}
