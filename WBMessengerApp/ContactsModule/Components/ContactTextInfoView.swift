//
//  ContactTextInfoView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 08.06.2024.
//

import SwiftUI

struct ContactTextInfoView: View {
    var contact: Contact
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(contact.firstName + " " + contact.lastName)
                .font(.headline)
                .bold()
                .foregroundStyle(.wbFont)
            Text("Last seen \(contact.lastVisit)")
                .font(.subheadline)
                .foregroundStyle(.wbDisable)
                .lineLimit(1)
        }
    }
}

#Preview {
    ContactTextInfoView(contact: Contact(id: 1,
                                         firstName: "Anna",
                                         lastName: "Lisichkina",
                                         lastVisit: Date(),
                                         imageName: "person"
                                        )
    )
}
