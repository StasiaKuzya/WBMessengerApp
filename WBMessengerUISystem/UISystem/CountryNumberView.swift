//
//  CountryNumberView.swift
//  WBMessengerUISystem
//
//  Created by Анастасия on 21.07.2024.
//

import SwiftUI

public struct CountryNumberView: View {
    public var isNumber: Bool = false
    public var textColor1: Color
    public var textColor2: Color
    public var bgColor: Color
    
    public init(isNumber: Bool,
                textColor1: Color,
                textColor2: Color,
                bgColor: Color
    ) {
        self.isNumber = isNumber
        self.textColor1 = textColor1
        self.textColor2 = textColor2
        self.bgColor = bgColor
    }
    
    public var body: some View {
        HStack {
            Image("flag")
            Text("+7")
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 8)
        .background(RoundedRectangle(cornerRadius: 4)
            .fill(bgColor))
        .foregroundStyle(isNumber ? textColor1 : textColor2)
        .bold()
    }
}

#Preview {
    CountryNumberView(isNumber: false, textColor1: .gray, textColor2: .black, bgColor: .gray.opacity(0.3))
}
