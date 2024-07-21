//
//  NumberInputView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 05.06.2024.
//

import SwiftUI
import WBMessengerUISystem

struct NumberInputView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appState: AppState
    @State private var phoneNumber: String = ""
    @State private var showProgress = false
    @State private var showCodeInput = false

    var body: some View {
        ZStack {
            Color.wbMainBG.ignoresSafeArea()
            VStack {
                Spacer()
                
                if showProgress {
                    AnimatedProgressView()
                } else {
                    VStack {
                        HeadlineView(headlineText: "verification_headline".localized(), 
                                     textColor: .wbFont)
                        CaptionView(caption: "verification_caption".localized(), 
                                    textColor: .wbFont)
                            .padding(.top, 8)
                        
                        ContactTelNumberView(number: $phoneNumber,
                                             isNumber: !phoneNumber.isEmpty,
                                             textColor1: .wbFont,
                                             textColor2: .wbSecondary,
                                             bgColor: .wbFontBG)
                            .padding(.top, 49)
                        
                        SaveButtonView(buttonText: "verification_continueButton".localized(), 
                                       isEnabled: phoneNumber.count == 13,
                                       textColor: .wbButtonText,
                                       bgColor: .wbDefaultPurple) {
                            withAnimation {
                                showProgress = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    showProgress = false
                                    showCodeInput = true
                                }
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
            .navigationDestination(isPresented: $showCodeInput) {
                CodeInputView(phoneNumber: phoneNumber)
            }
        }
    }
}

#Preview {
    NumberInputView()
}

//                appState.isWalkthroughCompleted = true
//                UserDefaults.standard.set(true, forKey: "walkthroughCompleted")
