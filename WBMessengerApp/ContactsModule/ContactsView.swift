//
//  ContactsView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 08.06.2024.
//

import SwiftUI

struct ContactsView: View {
    @State var contactSearch = ""
    private let contacts: [Contact] = [
        Contact(id: 1, firstName: "John", lastName: "Doe", lastVisit: Date(), imageName: nil),
        Contact(id: 2, firstName: "Jane", lastName: "Smith", lastVisit: Date(), imageName: nil),
        Contact(id: 3, firstName: "Janetta", lastName: "Tsmithova", lastVisit: Date(), imageName: nil),
        Contact(id: 4, firstName: "Alice", lastName: "Johnson", lastVisit: Date(), imageName: nil)
    ]
    
    var filteredContacts: [Contact] {
        if contactSearch.isEmpty {
            return contacts
        } else {
            return contacts.filter { contact in
                contact.firstName.lowercased().contains(contactSearch.lowercased()) ||
                contact.lastName.lowercased().contains(contactSearch.lowercased())
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ContactSearchView(contactSearch: $contactSearch)
                .padding(.top, 16)
            List(filteredContacts, id: \.id) { contact in
                ContantCellView(contact: contact)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowBackground(Color.wbFontBG2)
            }
            .listStyle(PlainListStyle())
            .background(.wbFontBG2)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 1)
        .background(.wbFontBG2)
    }
}

#Preview {
    ContactsView()
}
