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
    
    var body: some View {
        ZStack {
            Color.wbMainBG.ignoresSafeArea()
            VStack(alignment: .leading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.wbFont)
                }
                .padding()
                Spacer()
                TextField("",
                          text: $number,
                          prompt: Text("000 000-00-00")
                    .foregroundColor(.wbSecondary))
                .padding(.vertical, 6)
                .padding(.leading, 8)
                .background(RoundedRectangle(cornerRadius: 4)
                    .fill(.wbFontBG))
                Spacer()
                Button {
                    appState.isWalkthroughCompleted = true
                    UserDefaults.standard.set(true, forKey: "walkthroughCompleted")
                } label: {
                    Text("Войти")
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 30)
                            .fill(.wbDefaultPurple))
                        .foregroundStyle(.wbButtonText)
                        .font(.headline)
                        .bold()
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    VerificationView()
}
