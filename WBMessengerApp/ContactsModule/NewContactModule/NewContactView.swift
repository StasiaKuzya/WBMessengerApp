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
                NewContactCellView(placeholderText: "Имя (обязательно)", contactInfo: $firstName)
                    .padding(.top, 31)
                NewContactCellView(placeholderText: "Фамилия (опционально)", contactInfo: $lastName)
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
                SaveButtonView(buttonText: "Сохранить", isEnabled: !firstName.isEmpty, action:{})
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
                    TitleNavBar(titleNavBar: "Новый контакт")
                }
            }
        }
    }
}

#Preview {
    NewContactView()
}
