//
//  StartButtonView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 05.06.2024.
//

import SwiftUI

struct StartButtonView: View {
    @State var buttonText: String = ""
    @Binding var buttonTapped: Bool
    
    var body: some View {
        Button {
            buttonTapped = true
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
    }
}

#Preview {
    StartButtonView(buttonText: "Тест", buttonTapped: .constant(false))
}
