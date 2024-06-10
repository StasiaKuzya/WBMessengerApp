//
//  ContactDetailImageView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 10.06.2024.
//

import SwiftUI

struct ContactDetailImageView: View {
    var body: some View {
        Image("contactImage")
            .renderingMode(.template)
            .foregroundStyle(.wbFont)
            .background(
                Circle()
                    .fill(.wbFontBG)
                    .frame(width: 100, height: 100)
            )
            .overlay() {
                Button {
                    //TODO: add image for new contact
                } label: {
                    Text("+")
                        .bold()
                        .foregroundStyle(.wbFontBG)
                        .background(
                            Circle()
                                .fill(.wbFont)
                                .frame(width: 24, height: 24)
                        )
                        .offset(x: 38, y: 38)
                }
            }
    }
}

#Preview {
    ContactDetailImageView()
}
