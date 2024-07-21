//
//  CodeInputView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 07.07.2024.
//

import SwiftUI
import WBMessengerUISystem

struct CodeInputView: View {
    @State private var verificationCode = Array(repeating: "", count: 4)
    @Environment(\.presentationMode) var presentationMode
    var phoneNumber: String
    @FocusState private var focusedField: Int?
    
    var body: some View {
        ZStack {
            Color.wbMainBG.ignoresSafeArea()
            VStack(spacing: 0) {
                HeadlineView(headlineText: "codeinput_headline".localized(), 
                             textColor: .wbFont)
                CaptionView(caption: "\("codeinput_caption".localized())\n +7 \(phoneNumber)",
                            textColor: .wbFont)
                    .padding(.top, 8)
                
                HStack(spacing: 40) {
                    ForEach(0..<4, id: \.self) { index in
                        CodeDigitView(
                            text: $verificationCode[index],
                            isFocused: $focusedField,
                            index: index
                        )
                    }
                }
                .padding(.top, 49)
                
                Button(action: {
                    // Handle resending the code
                }) {
                    Text("codeinput_repeatRequest".localized())
                        .padding(.horizontal, 30)
                        .padding(.vertical, 12)
                        .foregroundStyle(.wbDefaultPurple)
                        .font(.headline)
                        .bold()
                }
                .padding(.top, 49)
            }
            .padding()
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        BackButtonNavBar()
                    }
                }
            }
            .onAppear {
                focusedField = 0
            }
        }
    }
}

#Preview {
    CodeInputView(phoneNumber: "909 100 00 99")
}
