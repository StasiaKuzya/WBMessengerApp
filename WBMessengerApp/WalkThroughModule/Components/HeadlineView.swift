//
//  HeadlineView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 05.06.2024.
//

import SwiftUI

struct HeadlineView: View {
    @State var headlineText: String = ""
    
    var body: some View {
        Text(headlineText)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .font(.title2)
            .bold()
            .foregroundStyle(.wbFont)
    }
}

#Preview {
    HeadlineView(headlineText: "Общайтесь с друзьями\nи близкими легко")
}
