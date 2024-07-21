//
//  HeadlineView.swift
//  WBMessengerUISystem
//
//  Created by Анастасия on 16.07.2024.
//

import SwiftUI

public struct HeadlineView: View {
    public var headlineText: String = ""
    public var textColor: Color
    
    public init(headlineText: String, textColor: Color) {
        self.headlineText = headlineText
        self.textColor = textColor
    }
    
    public var body: some View {
        Text(headlineText)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .font(.title2)
            .bold()
            .foregroundStyle(textColor)
    }
}

#Preview {
    HeadlineView(headlineText: "Общайтесь с друзьями\nи близкими легко", textColor: .black)
}
