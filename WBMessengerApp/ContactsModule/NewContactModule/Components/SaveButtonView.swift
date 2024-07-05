//
//  SaveButtonView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 10.06.2024.
//

import SwiftUI

struct SaveButtonView: View {
    @State var buttonText: String = ""
    @State var saveContactDetailData: Bool = false
    var isEnabled: Bool = true
    var action: () -> Void
    
    var body: some View {
        Button {
            saveContactDetailData.toggle()
            action()
        } label: {
            Text(buttonText)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.wbButtonText)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(.wbDefaultPurple))
                .opacity(isEnabled ? 1 : 0.5)
                .font(.headline)
                .bold()
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    SaveButtonView(buttonText: "Save", saveContactDetailData: false, isEnabled: false, action: {})
}
