//
//  ContactPlaceholderView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 09.06.2024.
//

import SwiftUI

struct ContactPlaceholderView: View {
    let firstName: String
    let lastName: String
    
    var body: some View {
        let initials = "\(firstName.prefix(1))\(lastName.prefix(1))"
        Text(initials)
            .font(.headline)
            .bold()
            .foregroundColor(.white)
            .frame(width: 48, height: 48)
            .background(RoundedRectangle(cornerRadius: 16)
                .fill(Color.wbDefaultPurple))
    }
}

#Preview {
    ContactPlaceholderView(firstName: "Lana", lastName: "Nelana")
}
