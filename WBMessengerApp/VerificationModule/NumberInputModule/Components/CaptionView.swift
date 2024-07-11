//
//  CaptionView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 04.07.2024.
//

import SwiftUI

struct CaptionView: View {
    var caption: String = ""
    
    var body: some View {
        Text(caption)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .font(.callout)
    }
}

#Preview {
    CaptionView(caption: "Мы вышлем код подтверждения на указанный номер")
}
