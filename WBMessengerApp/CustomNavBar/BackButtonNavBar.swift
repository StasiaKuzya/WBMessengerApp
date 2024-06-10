//
//  BackButtonNavBar.swift
//  WBMessengerApp
//
//  Created by Анастасия on 10.06.2024.
//

import SwiftUI

struct BackButtonNavBar: View {
    var body: some View {
        Image(systemName: "chevron.left")
            .resizable()
            .frame(width: 7.42, height: 12.02)
            .background(Rectangle()
                .fill(.clear)
                .frame(width: 24, height: 24)
                )
            .foregroundStyle(.wbFont)
            .bold()
    }
}

#Preview {
    BackButtonNavBar()
}
