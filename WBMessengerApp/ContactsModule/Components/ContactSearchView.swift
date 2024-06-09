//
//  ContactSearchView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 09.06.2024.
//

import SwiftUI

struct ContactSearchView: View {
    @Binding var contactSearch: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.wbDisable)
            TextField("",
                      text: $contactSearch,
                      prompt: Text("Search")
                .foregroundColor(.wbDisable))
        }
        .bold()
        .padding(.vertical, 6)
        .padding(.leading, 8)
        .background(RoundedRectangle(cornerRadius: 4)
            .fill(.wbFontBG))
    }
}

#Preview {
    ContactSearchView(contactSearch: .constant(""))
}
