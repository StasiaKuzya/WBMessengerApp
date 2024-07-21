//
//  ContactDetailView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 10.06.2024.
//

import SwiftUI
import WBMessengerUISystem

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
                NewContactCellView(placeholderText: "newContact_firstName".localized(), contactInfo: $firstName, textColor: .wbSecondary, bgColor: .wbFontBG)
                    .padding(.top, 31)
                NewContactCellView(placeholderText: "newContact_lastName".localized(), contactInfo: $lastName, textColor: .wbSecondary, bgColor: .wbFontBG)
                Divider()
                    .background(.wbDivider)
                    .padding(.top, 4)
                ContactTelNumberView(number: $phoneNumber,
                                     isNumber: !phoneNumber.isEmpty,
                                     textColor1: .wbFont,
                                     textColor2: .wbSecondary,
                                     bgColor: .wbFontBG)
                    .padding(.top, 4)
                Divider()
                    .background(.wbDivider)
                    .padding(.top, 4)
                NewContactCellView(placeholderText: "twitter", contactInfo: $twitter, textColor: .wbSecondary, bgColor: .wbFontBG)
                    .padding(.top, 4)
                NewContactCellView(placeholderText: "@instagram", contactInfo: $instagram, textColor: .wbSecondary, bgColor: .wbFontBG)
                NewContactCellView(placeholderText: "linkedin", contactInfo: $linkedin, textColor: .wbSecondary, bgColor: .wbFontBG)
                NewContactCellView(placeholderText: "facebook/profile", contactInfo: $facebook, textColor: .wbSecondary, bgColor: .wbFontBG)
                SaveButtonView(buttonText: "newContact_saveButton".localized(), 
                               isEnabled: !firstName.isEmpty,
                               textColor: .wbButtonText,
                               bgColor: .wbDefaultPurple,
                               action:{})
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
