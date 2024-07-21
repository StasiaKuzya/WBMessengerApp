//
//  SaveButtonView.swift
//  WBMessengerUISystem
//
//  Created by Анастасия on 21.07.2024.
//

import SwiftUI

public struct SaveButtonView: View {
    @State public var buttonText: String = ""
    @State public var saveContactDetailData: Bool = false
    public var isEnabled: Bool = true
    public var textColor: Color
    public var bgColor: Color
    public var action: () -> Void
    
    
    public init(buttonText: String = "", 
                isEnabled: Bool = true,
                textColor: Color,
                bgColor: Color,
                action: @escaping () -> Void
    ) {
        self._buttonText = State(initialValue: buttonText)
        self._saveContactDetailData = State(initialValue: false)
        self.isEnabled = isEnabled
        self.textColor = textColor
        self.bgColor = bgColor
        self.action = action
    }
    
    public var body: some View {
        Button {
            saveContactDetailData.toggle()
            action()
        } label: {
            Text(buttonText)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .foregroundStyle(textColor)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(bgColor))
                .opacity(isEnabled ? 1 : 0.5)
                .font(.headline)
                .bold()
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    SaveButtonView(textColor: .white, bgColor: .purple, action: {})
}
