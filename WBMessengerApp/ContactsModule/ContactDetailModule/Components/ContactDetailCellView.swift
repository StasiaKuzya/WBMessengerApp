//
//  ContactDetailCellView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 10.06.2024.
//

import SwiftUI

struct ContactDetailCellView: View {
    @State var placeholderText: String
    @Binding var contactInfo: String
    
    var body: some View {
        TextField("",
                  text: $contactInfo,
                  prompt: Text(placeholderText)
            .foregroundColor(.wbSecondary))
        .bold()
        .padding(.vertical, 6)
        .padding(.leading, 8)
        .background(RoundedRectangle(cornerRadius: 4)
            .fill(.wbFontBG))
    }
}

#Preview {
    ContactDetailCellView(placeholderText: "Test0", contactInfo: .constant(""))
}
