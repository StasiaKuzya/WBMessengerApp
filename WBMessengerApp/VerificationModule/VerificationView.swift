//
//  VerificationView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 05.06.2024.
//

import SwiftUI

struct VerificationView: View {
    @State var number = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appState: AppState
    @State private var phoneNumber: String = ""
    @State private var showProgress = false

    var body: some View {
        ZStack {
            Color.wbMainBG.ignoresSafeArea()
            VStack {
                Spacer()
                
                if showProgress {
                    AnimatedProgressView()
                } else {
                    VStack {
                        HeadlineView(headlineText: "Введите номер телефона")
                        CaptionView(caption: "Мы вышлем код подтверждения на указанный номер")
                            .padding(.top, 8)
                        
                        ContactTelNumberView(number: $phoneNumber, isNumber: !phoneNumber.isEmpty)
                            .padding(.top, 49)
                        
                        SaveButtonView(buttonText: "Продолжить", isEnabled: phoneNumber.count == 13) {
                            withAnimation {
                                showProgress = true
                            }
                        }
                        .padding(.top, 69)
                    }
                    .transition(.scale)
                    .padding(.horizontal, 24)
                }
                
                Spacer()
            }
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
        }
    }
}

#Preview {
    VerificationView()
}

//                appState.isWalkthroughCompleted = true
//                UserDefaults.standard.set(true, forKey: "walkthroughCompleted")
