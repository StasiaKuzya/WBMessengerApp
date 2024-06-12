//
//  StartButtonView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 05.06.2024.
//

import SwiftUI

struct StartButtonView: View {
    @State var buttonText: String = ""
    @State var showModalScreen: Bool = false
    
    var body: some View {
        Button {
            showModalScreen.toggle()
        } label: {
            Text(buttonText)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(.wbDefaultPurple))
                .foregroundStyle(.wbButtonText)
                .font(.headline)
                .bold()
        }
        .sheet(isPresented: $showModalScreen, content: {
            VerificationView()
        })
    }
}

#Preview {
    StartButtonView(buttonText: "Тест")
}
