//
//  ContactTextInfoView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 08.06.2024.
//

import SwiftUI

struct ContactTextInfoView: View {
    var contact: MockUser
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(contact.firstName + " " + contact.lastName)
                .font(.subheadline)
                .bold()
                .foregroundStyle(.wbFont)
            Text(contact.isOnline ? "Online" : "\("contacts_lastSeen".localized()) \(contact.lastVisit, formatter: dateFormatter)")
                .font(.footnote)
                .foregroundStyle(.wbDisable)
                .lineLimit(1)
        }
        .padding(.top, 6)
    }
}

#Preview {
    ContactTextInfoView(contact: MockUser(id: "1",
                                         firstName: "Anna",
                                         lastName: "Lisichkina",
                                         lastVisit: Date(),
                                         imageName: "person",
                                         isStory: false,
                                         isOnline: false
                                        )
    )
}
