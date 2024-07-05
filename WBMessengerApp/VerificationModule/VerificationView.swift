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
                        HeadlineView(headlineText: "verification_haedline".localized())
                        CaptionView(caption: "verification_caption".localized())
                            .padding(.top, 8)
                        
                        ContactTelNumberView(number: $phoneNumber, isNumber: !phoneNumber.isEmpty)
                            .padding(.top, 49)
                        
                        SaveButtonView(buttonText: "verification_continueButton".localized(), isEnabled: phoneNumber.count == 13) {
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
