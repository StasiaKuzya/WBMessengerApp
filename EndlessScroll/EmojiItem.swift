//
//  EmojiItem.swift
//  WBMessengerApp
//
//  Created by Анастасия on 02.07.2024.
//

import Foundation
import SwiftUI

struct EmojiItem: Identifiable, Equatable {
    let id = UUID()
    let emoji: String
    let size1: CGSize
    let size2: CGSize
    let size3: CGSize
    
    static func randomEmoji() -> String {
        let range = 0x1F300...0x1F3F0
        let codepoint = range.randomElement()!
        return String(UnicodeScalar(codepoint)!)
    }
    
    static func ==(lhs: EmojiItem, rhs: EmojiItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func randomItem() -> EmojiItem {
        let totalWidth: CGFloat = 300
        let totalHeight: CGFloat = 100
        let sizes = generateRandomSizes(totalWidth: totalWidth, totalHeight: totalHeight)
        return EmojiItem(
            emoji: randomEmoji(),
            size1: sizes[0],
            size2: sizes[1],
            size3: sizes[2]
        )
    }
    
    static func generateRandomSizes(totalWidth: CGFloat, totalHeight: CGFloat) -> [CGSize] {
        let width1 = CGFloat.random(in: totalWidth * 0.2 ... totalWidth * 0.8)
        let width2 = totalWidth - width1
        let width3 = totalWidth
        
        let height3 = CGFloat.random(in: totalHeight * 0.2 ... totalHeight * 0.8)
        let height1 = totalHeight - height3
        let height2 = height1
        
        let size1 = CGSize(width: width1, height: height1)
        let size2 = CGSize(width: width2, height: height2)
        let size3 = CGSize(width: width3, height: height3)
        
        return [size1, size2, size3]
    }
}
