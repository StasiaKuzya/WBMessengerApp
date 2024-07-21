//
//  CaptionView.swift
//  WBMessengerUISystem
//
//  Created by Анастасия on 16.07.2024.
//

import SwiftUI

public struct CaptionView: View {
    public var caption: String = ""
    public var textColor: Color
    
    public init(caption: String, textColor: Color) {
        self.caption = caption
        self.textColor = textColor
    }
    
    public var body: some View {
        Text(caption)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .font(.callout)
            .foregroundStyle(textColor)
    }
}

#Preview {
    CaptionView(caption: "Мы вышлем код подтверждения на указанный номер", textColor: .black)
}
