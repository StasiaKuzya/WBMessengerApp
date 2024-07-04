//
//  ContentView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 05.06.2024.
//

import SwiftUI

struct WalkthroughView: View {
    @Binding var buttonTapped: Bool
    
    var body: some View {
        ZStack {
            Color.wbMainBG.ignoresSafeArea()
            VStack {
                Spacer()
                Image("walktrough")
                HeadlineView(headlineText:  "Общайтесь с друзьями\nи близкими легко")
                    .padding(.top, 42)
                Spacer()
                UserAgreementButtonView()
                StartButtonView(buttonText: "Начать общаться", buttonTapped: $buttonTapped)
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
