//
//  ContactTelNumberView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 10.06.2024.
//

import SwiftUI

struct ContactTelNumberView: View {
    @Binding var number: String
    var isNumber: Bool = false
    
    var body: some View {
        HStack {
            CountryNumberView(isNumber: isNumber)
            TextField("",
                      text: $number,
                      prompt: Text("000 000-00-00")
                .foregroundColor(.wbSecondary))
            .padding(.vertical, 6)
            .padding(.leading, 8)
            .background(RoundedRectangle(cornerRadius: 4)
                .fill(.wbFontBG))
            .bold()
            .keyboardType(.numberPad)
        }
    }
}

#Preview {
    ContactTelNumberView(number: .constant(""))
}
