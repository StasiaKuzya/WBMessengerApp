//
//  CodeDigitView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 07.07.2024.
//

import SwiftUI

struct CodeDigitView: View {
    @Binding var text: String
    @FocusState.Binding var isFocused: Int?
    var index: Int

    var body: some View {
        TextField("", text: $text)
            .tint(.wbDefaultPurple)
            .font(.largeTitle)
            .bold()
            .frame(width: 32, height: 40)
            .background(
                Circle()
                    .fill(.wbFontBG)
                    .frame(width: 24, height: 24))
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .focused($isFocused, equals: index)
            .onChange(of: text) { _, newValue in
                if newValue.count > 1 {
                    text = String(newValue.prefix(1))
                }
                if !newValue.isEmpty {
                    isFocused = index + 1
                }
            }
    }
}

//#Preview { CodeDigitView() }
