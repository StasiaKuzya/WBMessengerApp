//
//  UserAgreementView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 05.06.2024.
//

import SwiftUI

struct UserAgreementButtonView: View {
    var body: some View {
        Button {} label: {
            Text("Пользовательское соглашение")
                .foregroundStyle(.wbFont)
                .font(.caption)
                .bold()
        }
    }
}

#Preview {
    UserAgreementButtonView()
}
