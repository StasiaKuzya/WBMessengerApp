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
    
    var body: some View {
        Button {
            saveContactDetailData.toggle()
        } label: {
            Text(buttonText)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(.wbDefaultPurple))
                .foregroundStyle(.wbButtonText)
                .font(.subheadline)
                .bold()
        }
    }
}

#Preview {
    SaveButtonView(buttonText: "Test", saveContactDetailData: false)
}
