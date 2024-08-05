//
//  InputView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 01.08.2024.
//

import SwiftUI
import ExyteChat

struct InputView: View {
    @Binding var textBinding: String
    var replyMessage: ReplyMessage?
    var plusAction: () -> Void
    var sendAction: () -> Void
    var cancelAction: () -> Void
    
    @State private var showReplyMessage: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let replyMessage = replyMessage {
                
                HStack {
                    Image(systemName: "arrowshape.turn.up.backward.fill").foregroundStyle(.wbDefaultPurple)
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Replying to:")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Text(replyMessage.text)
                            .font(.footnote)
                            .foregroundColor(.wbFont)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                    Spacer()
                    Button(action: {
                        cancelAction()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.wbDefaultPurple)
                    }
                }
                .frame(height: 44)
                .padding(.horizontal, 16)
            }
            
            HStack {
                Button {
                    plusAction()
                } label: {
                    Image(systemName: "plus").foregroundStyle(.wbSecondary)
                }
                
                TextField("", text: $textBinding, prompt: Text("Message"))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 8)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.wbFontBG))
                    .foregroundColor(.wbFont)
                
                Button {
                    sendAction()
                } label: {
                    Image(systemName: "paperplane.fill").foregroundStyle(.wbDefaultPurple)
                }
                .disabled(textBinding.isEmpty)
            }
            .padding(.horizontal, 16)
        }
        .padding(.bottom, 8)
    }
}

#Preview {
    InputView(textBinding: .constant("test"),
              plusAction: {},
              sendAction: {},
              cancelAction: {}
    )
}
