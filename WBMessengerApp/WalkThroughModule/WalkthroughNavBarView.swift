//
//  WalkthroughNavBarView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 04.07.2024.
//

import SwiftUI

struct WalkthroughNavBarView: View {
    @State var buttonTapped: Bool = false
    
    var body: some View {
        NavigationStack() {
            WalkthroughView(buttonTapped: $buttonTapped)
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(isPresented: $buttonTapped) {
                    NumberInputView()
                }
        }
    }
}

#Preview {
    WalkthroughNavBarView()
}
