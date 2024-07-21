//
//  ContentView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 05.06.2024.
//

import SwiftUI
import WBMessengerUISystem

struct WalkthroughView: View {
    @Binding var buttonTapped: Bool
    
    var body: some View {
        ZStack {
            Color.wbMainBG.ignoresSafeArea()
            VStack {
                Spacer()
                Image("walktrough")
                HeadlineView(headlineText: "walkthrough_headline".localized(),
                             textColor: .wbFont)
                    .padding(.top, 42)
                Spacer()
                UserAgreementButtonView()
                StartButtonView(buttonText: "walkthrough_startButton".localized(), buttonTapped: $buttonTapped)
                    .padding(.horizontal, 24)
                    .padding(.top, 18)
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    WalkthroughView(buttonTapped: .constant(false))
}
