//
//  CountryNumberView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 10.06.2024.
//

import SwiftUI

struct CountryNumberView: View {
    var isNumber: Bool = false
    var body: some View {
        HStack {
            Image("flag")
            Text("+7")
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 8)
        .background(RoundedRectangle(cornerRadius: 4)
            .fill(.wbFontBG))
        .foregroundStyle(isNumber ? .wbFont : .wbSecondary)
        .bold()
    }
}

#Preview {
    CountryNumberView(isNumber: false)
}
