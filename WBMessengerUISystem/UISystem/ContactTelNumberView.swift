//
//  ContactTelNumberView.swift
//  WBMessengerUISystem
//
//  Created by Анастасия on 21.07.2024.
//

import SwiftUI

public struct ContactTelNumberView: View {
    @Binding public var number: String
    public var isNumber: Bool = false
    public var textColor1: Color
    public var textColor2: Color
    public var bgColor: Color
    
    public init(number: Binding<String>,
                isNumber: Bool,
                textColor1: Color,
                textColor2: Color,
                bgColor: Color
    ) {
        self._number = number
        self.isNumber = isNumber
        self.textColor1 = textColor1
        self.textColor2 = textColor2
        self.bgColor = bgColor
    }
    
    public var body: some View {
        HStack {
            CountryNumberView(isNumber: isNumber, textColor1: textColor1, textColor2: textColor2, bgColor: bgColor)
            TextField("000 000-00-00", text: $number)
                .onChange(of: number, { _, newValue in
                    self.number = formatPhoneNumber(newValue)
                })
                .padding(.vertical, 6)
                .padding(.leading, 8)
                .background(RoundedRectangle(cornerRadius: 4)
                    .fill(bgColor))
                .bold()
                .keyboardType(.numberPad)
        }
    }
    
    private func formatPhoneNumber(_ number: String) -> String {
        let digits = number.filter { $0.isNumber }
        var formattedNumber = ""

        for (index, digit) in digits.enumerated() {
            if index == 3 || index == 6 || index == 8 || index == 10 {
                formattedNumber += " "
            }
            formattedNumber.append(digit)
        }
        return String(formattedNumber.prefix(13))
    }
}

#Preview {
    ContactTelNumberView(number: .constant(""), isNumber: false, textColor1: .gray, textColor2: .black, bgColor: .gray.opacity(0.3))
}
