//
//  SaveButtonView.swift
//  WBMessengerUISystem
//
//  Created by Анастасия on 21.07.2024.
//

import SwiftUI

public struct NewContactCellView: View {
    @State public var placeholderText: String
    @Binding public var contactInfo: String
    public var textColor: Color
    public var bgColor: Color
    
    public init(placeholderText: String,
                contactInfo: Binding<String>,
                textColor: Color,
                bgColor: Color
    ) {
        self._placeholderText = State(initialValue: placeholderText)
        self._contactInfo = contactInfo
        self.textColor = textColor
        self.bgColor = bgColor
    }
    
    public var body: some View {
        TextField("",
                  text: $contactInfo,
                  prompt: Text(placeholderText)
                  .foregroundColor(textColor))
        .bold()
        .font(.subheadline)
        .padding(.vertical, 6)
        .padding(.leading, 8)
        .background(RoundedRectangle(cornerRadius: 4)
            .fill(bgColor))
    }
}

#Preview {
    NewContactCellView(placeholderText: "Test0", contactInfo: .constant(""), textColor: .black, bgColor: .gray.opacity(0.3))
}
