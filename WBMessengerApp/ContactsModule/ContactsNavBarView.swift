//
//  ContactsView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 08.06.2024.
//

import SwiftUI

struct ContactsNavBarView: View {
    @State var contactPath = [Contact]()
    
    var body: some View {
        ZStack {
            Color.wbFontBG2.ignoresSafeArea()
            NavigationStack(path: $contactPath) {
                ContactsView(contactPath: $contactPath)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            TitleNavBar(titleNavBar: "contacts_navBarTitle".localized())
                                .padding(.leading, 24)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: NewContactView()) {
                                Image(systemName: "plus").renderingMode(.template)
                                    .foregroundStyle(.wbFont)
                                    .bold()
                                    .padding(.trailing, 24)
                            }
                        }
                    }
                    .navigationDestination(for: Contact.self) { contact in
                        PersonalChatNavView(contact: contact)
                    }
            }
            
        }
    }
}

#Preview {
    ContactsNavBarView()
}
