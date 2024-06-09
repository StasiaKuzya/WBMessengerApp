//
//  PersonalChatView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 09.06.2024.
//

import SwiftUI

struct PersonalChatView: View {
    @Environment(\.presentationMode) var presentationMode
    let contact: Contact
    
    var body: some View {
        Text("\(contact.firstName) \(contact.lastName)")
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.wbFont)
                            .bold()
                    }
                    Button(action: {
                        //TODO: Chat detailization with contact
                    }) {
                        let lastNamePrefix = contact.lastName.prefix(1)
                        Text("\(contact.firstName) \(String(lastNamePrefix)).")
                            .foregroundStyle(.wbFont)
                            .font(.title3)
                            .bold()
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(action: {
                        //TODO: Chat search with contact
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.wbFont)
                            .bold()
                    }
                    Button(action: {
                        //TODO: Chat info with contact
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .foregroundStyle(.wbFont)
                            .bold()
                    }
                }
            }
    }
}

#Preview {
    PersonalChatView(contact: Contact(id: 1,
                                     firstName: "Anna",
                                     lastName: "Lisichkina",
                                     lastVisit: Date(),
                                      imageName: nil,
                                      isStory: false,
                                      isOnline: false
                                    )
                     )
}
