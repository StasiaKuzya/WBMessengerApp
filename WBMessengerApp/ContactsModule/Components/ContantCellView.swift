//
//  ContantCellView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 08.06.2024.
//

import SwiftUI

//TODO: create file for struct Contact
struct Contact {
    let id: Int
    let firstName: String
    let lastName: String
    let lastVisit: Date
    let imageName: String?
}

struct ContantCellView: View {
    var contact: Contact
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            if let imageName = contact.imageName, let url = URL(string: imageName) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .frame(width: 48, height: 48)
                        .background(RoundedRectangle(cornerRadius: 16)
                            .fill(.clear))
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ContactPlaceholderView(firstName: contact.firstName, lastName: contact.lastName)
                }
            } else {
                ContactPlaceholderView(firstName: contact.firstName, lastName: contact.lastName)
            }
            ContactTextInfoView(contact: contact)
        }
        .padding(.top, 16)
        .padding(.bottom, 12)
        .background(.wbFontBG2)
    }
}

#Preview {
    ContantCellView(contact: Contact(id: 1,
                                     firstName: "Anna",
                                     lastName: "Lisichkina",
                                     lastVisit: Date(),
                                     imageName: "https://img.freepik.com/free-photo/medium-shot-beautiful-woman-with-braids_23-2151429540.jpg?t=st=1717849084~exp=1717852684~hmac=b6f419253825f431a57cddd0b3935160d5803ff6a0c805a47a1723f0e92c0188&w=740"
                                    )
    )
}
