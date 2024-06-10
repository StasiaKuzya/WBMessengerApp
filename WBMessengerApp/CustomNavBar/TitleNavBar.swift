//
//  TitleNavBar.swift
//  WBMessengerApp
//
//  Created by Анастасия on 10.06.2024.
//

import SwiftUI

struct TitleNavBar: View {
    @State var titleNavBar: String
    var body: some View {
        Text(titleNavBar)
            .foregroundStyle(.wbFont)
            .font(.title3)
            .bold()
    }
}

#Preview {
    TitleNavBar(titleNavBar: "Test")
}
