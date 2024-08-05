//
//  ContactsView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 08.06.2024.
//

import SwiftUI
import Combine

struct ContactsView: View {
    @Binding var contactPath: [MockUser]
    @State var contactSearch = ""
    @State private var cancellables: Set<AnyCancellable> = []
    @State private var contacts: [MockUser] = []
    private let mockChatData = MockChatData()
    
    var filteredContacts: [MockUser] {
        if contactSearch.isEmpty {
            return contacts
        } else {
            return contacts.filter { contact in
                contact.firstName.lowercased().contains(contactSearch.lowercased()) ||
                contact.lastName.lowercased().contains(contactSearch.lowercased())
            }
        }
    }
    
    init(contactPath: Binding<[MockUser]>) {
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
        .navigationDestination(for: MockUser.self) { contact in
            PersonalChatNavView(contact: contact)
        }
        .onAppear {
            fetcMockhContacts() // TODO: change mock on real whem back is ready
            fetchContacts()
        }
    }
    
    private func fetchContacts() {
        APIClient().fetchContacts()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Failed to fetch contacts: \(error)")
                }
            }, receiveValue: { fetchedContacts in
                self.contacts = fetchedContacts
            })
            .store(in: &cancellables)
    }
    
    private func fetcMockhContacts() {
        contacts = [mockChatData.john, mockChatData.jane, mockChatData.janetta, mockChatData.alice, mockChatData.alex]
    }
}

#Preview {
    ContactsView(contactPath: .constant([MockUser(id: "2",
                                                 firstName: "Anna",
                                                 lastName: "Lisichkina",
                                                 lastVisit: Date(),
                                                 imageName: nil,
                                                 isStory: false,
                                                 isOnline: false
                                                )]))
}
