//
//  ContactsView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 08.06.2024.
//

import SwiftUI

struct ContactsView: View {
    @State var contactSearch = ""
    @Binding var contactPath: [Contact]
    private let contacts: [Contact] = [
        .init(id: 1, firstName: "John", lastName: "Doe", lastVisit: Date(), imageName: nil, isStory: false, isOnline: false),
        .init(id: 2, firstName: "Jane", lastName: "Smith", lastVisit: Date(), imageName: nil, isStory: false, isOnline: true),
        .init(id: 3, firstName: "Janetta", lastName: "Tsmithova", lastVisit: Date(), imageName: nil, isStory: true, isOnline: false),
        .init(id: 4, firstName: "Alice", lastName: "Johnson", lastVisit: Date(), imageName: nil, isStory: true, isOnline: true),
        .init(id: 5, firstName: "Alex", lastName: "John", lastVisit: Date(), imageName: nil, isStory: false, isOnline: false)
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
    
    init(contactPath: Binding<[Contact]>) {
        self._contactPath = contactPath
        DataManager.shared.saveContactCount(contacts.count)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ContactSearchView(contactSearch: $contactSearch)
                .padding(.top, 16)
            
            List(filteredContacts, id: \.id) { contact in
                Button {
                    contactPath.append(contact)
                } label: {
                    ContantCellView(contact: contact)
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color.wbFontBG2)
            }
            .listStyle(PlainListStyle())
            .background(Color.wbFontBG2)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 1)
        .background(Color.wbFontBG2)
        .navigationDestination(for: Contact.self) { contact in
            PersonalChatView(contact: contact)
        }
    }
}

#Preview {
    ContactsView(contactPath: .constant([Contact(id: 1,
                                                 firstName: "Anna",
                                                 lastName: "Lisichkina",
                                                 lastVisit: Date(),
                                                 imageName: nil,
                                                 isStory: false,
                                                 isOnline: false
                                                )]))
}
