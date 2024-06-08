//
//  ContactsView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 08.06.2024.
//

import SwiftUI

struct ContactsNavBarView: View {
    var body: some View {
        ZStack {
            Color.wbFontBG.ignoresSafeArea()
            NavigationView {
                ContactsView()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("Контакты")
                                .font(.title3)
                                .bold()
                                .padding(.leading, 24)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                //TODO: tranfer to contacts
                            }) {
                                Image(systemName: "plus").renderingMode(.template)
                                    .foregroundStyle(.wbFont)
                                    .bold()
                                    .padding(.trailing, 24)
                            }
                        }
                    }
            }
            
        }
    }
}

#Preview {
    ContactsNavBarView()
}
