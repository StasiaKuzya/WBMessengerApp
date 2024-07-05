//
//  ContactDetailView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 10.06.2024.
//

import SwiftUI

struct NewContactView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var twitter: String = ""
    @State private var instagram: String = ""
    @State private var linkedin: String = ""
    @State private var facebook: String = ""
    @State private var phoneNumber: String = ""

    var body: some View {
        ZStack {
            Color.wbFontBG2.ignoresSafeArea()
            VStack(spacing: 12) {
                ContactDetailImageView()
                NewContactCellView(placeholderText: "newContact_firstName".localized(), contactInfo: $firstName)
                    .padding(.top, 31)
                NewContactCellView(placeholderText: "newContact_lastName".localized(), contactInfo: $lastName)
                Divider()
                    .background(.wbDivider)
                    .padding(.top, 4)
                ContactTelNumberView(number: $phoneNumber, isNumber: !phoneNumber.isEmpty)
                    .padding(.top, 4)
                Divider()
                    .background(.wbDivider)
                    .padding(.top, 4)
                NewContactCellView(placeholderText: "twitter", contactInfo: $twitter)
                    .padding(.top, 4)
                NewContactCellView(placeholderText: "@instagram", contactInfo: $instagram)
                NewContactCellView(placeholderText: "linkedin", contactInfo: $linkedin)
                NewContactCellView(placeholderText: "facebook/profile", contactInfo: $facebook)
                SaveButtonView(buttonText: "newContact_saveButton".localized(), isEnabled: !firstName.isEmpty, action:{})
                    .padding(.top, 13)
            }
            .padding(.horizontal, 24)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        BackButtonNavBar()
                    }
                    TitleNavBar(titleNavBar: "newContact_navBarTitle".localized())
                }
            }
        }
    }
}

#Preview {
    NewContactView()
}
