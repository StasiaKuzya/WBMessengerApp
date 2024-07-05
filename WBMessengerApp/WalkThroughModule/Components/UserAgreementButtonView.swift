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
            Text("walkthrough_userAgreement".localized())
                .foregroundStyle(.wbFont)
                .font(.caption)
                .bold()
        }
    }
}

#Preview {
    UserAgreementButtonView()
}
