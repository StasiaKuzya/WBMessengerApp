//
//  PersonalChatNavView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 31.07.2024.
//

import SwiftUI

struct PersonalChatNavView: View {
    @Environment(\.presentationMode) var presentationMode
    let contact: MockUser
    
    var body: some View {
        PersonalChatView(title: "")
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        BackButtonNavBar()
                    }
                    Button(action: {
                        //TODO: Chat detailization with contact
                    }) {
                        let lastNamePrefix = contact.lastName.prefix(1)
                        TitleNavBar(titleNavBar: "\(contact.firstName) \(String(lastNamePrefix)).")
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
    PersonalChatNavView(contact: MockUser(id: "11",
                                         firstName: "Anna",
                                         lastName: "Lisichkina",
                                         lastVisit: Date(),
                                          imageName: nil,
                                          isStory: false,
                                          isOnline: false
                                        )
                         )
}
