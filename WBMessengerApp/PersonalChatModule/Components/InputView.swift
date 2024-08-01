//
//  InputView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 01.08.2024.
//

import SwiftUI

struct InputView: View {
    @Binding var textBinding: String
    var plusAction: () -> Void
    var sendAction: () -> Void
    
    var body: some View {
        HStack {
            Button {
                plusAction()
            } label: {
                Image("plus")
            }
            
            TextField("",
                      text: $textBinding,
                      prompt: Text("Message"))
            .padding(.vertical, 6)
            .padding(.horizontal, 8)
            .background(RoundedRectangle(cornerRadius: 10).fill(.wbFontBG))
            .foregroundStyle(.wbFont)
            
            Button {
                sendAction()
            } label: {
                Image("send")
            }
            .disabled(textBinding.isEmpty)
        }
        .padding()
    }
}

#Preview {
    InputView(textBinding: .constant("test"), plusAction: {}, sendAction: {})
}
