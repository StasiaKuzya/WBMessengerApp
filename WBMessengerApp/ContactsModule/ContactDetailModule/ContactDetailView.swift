//
//  ContactDetailView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 10.06.2024.
//

import SwiftUI

struct ContactDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.wbFontBG2.ignoresSafeArea()
            VStack(spacing: 12) {
                ContactDetailImageView()
                ContactDetailCellView(placeholderText: "Имя (обязательно)", contactInfo: "")
                    .padding(.top, 31)
                ContactDetailCellView(placeholderText: "Фамилия (опционально)", contactInfo: "")
                Divider()
                    .background(.wbDivider)
                    .padding(.top, 4)
                ContactTelNumberView()
                    .padding(.top, 4)
                Divider()
                    .background(.wbDivider)
                    .padding(.top, 4)
                ContactDetailCellView(placeholderText: "twitter", contactInfo: "")
                    .padding(.top, 4)
                ContactDetailCellView(placeholderText: "@instagram", contactInfo: "")
                ContactDetailCellView(placeholderText: "linkdin", contactInfo: "")
                ContactDetailCellView(placeholderText: "facebook/profile", contactInfo: "")
                SaveButtonView(buttonText: "Сохранить")
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
    ContactDetailView()
}
