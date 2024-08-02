//
//  PersonalChatView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 09.06.2024.
//

import SwiftUI
import Foundation
import ExyteChat

struct PersonalChatView: View {
    @StateObject private var viewModel: ChatViewModel
    private let title: String
    @State private var replyToMessage: ReplyMessage?
    
    init(viewModel: ChatViewModel = ChatViewModel(), title: String) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.title = title
    }
    
    var body: some View {
        ChatView(messages: viewModel.messages, chatType: .conversation, replyMode: .answer) { draft in
            viewModel.send(draft: draft, replyToMessage: replyToMessage)
            replyToMessage = nil
        }
    messageBuilder: { message, positionInUserGroup, positionInCommentsGroup, showContextMenuClosure, messageActionClosure, showAttachmentClosure in
            ZStack {
                Color.wbFontBG.ignoresSafeArea()
                VStack {
                    if message.user.id == "1" {
                        HStack {
                            Spacer()
                            VStack(alignment: .trailing, spacing: 10) {
                                if let replyMessage = message.replyMessage {
                                    RepliedMessage(text: replyMessage.text)
                                }
                                SentMessageView(message: message)
                            }
                            .padding(.all, 10)
                            .background(Rectangle().fill(.wbDefaultPurple))
                            .foregroundStyle(.wbWhite)
                            .cornerRadius(10, corners: [.topLeft, .topRight, .bottomLeft])
                        }
                    } else {
                        HStack {
                            VStack(alignment: .trailing, spacing: 10) {
                                if let replyMessage = message.replyMessage {
                                    RepliedMessage(text: replyMessage.text)
                                }
                                RecievedMessageView(message: message)
                            }
                            .padding(.all, 10)
                            .background(Rectangle().fill(.wbFontBG2))
                            .foregroundColor(.wbFont)
                            .cornerRadius(10, corners: [.topLeft, .topRight, .bottomRight])
                            Spacer()
                        }
                    }
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
            }
        }
    inputViewBuilder: { textBinding, attachments, inputViewState, inputViewStyle, inputViewActionClosure, dismissKeyboardClosure in
        InputView(textBinding: textBinding,
                  replyMessage: replyToMessage,
                  plusAction: { inputViewActionClosure(.photo) },
                  sendAction: { inputViewActionClosure(.send) },
                  cancelAction: { replyToMessage = nil }
        )
        .padding(.top, 10)
        .background(.wbFontBG2)
        .padding(.top, -10)
    }
    messageMenuAction: { (action: ActionChat, defaultActionClosure, message) in
        switch action {
        case .reply:
            replyToMessage = message.toReplyMessage()
        case .delete:
            // TODO: add deletion logic
            print("delete message")
        }
    }
    .enableLoadMore(pageSize: 3) { message in
        viewModel.loadMoreMessage(before: message)
    }
    .messageUseMarkdown(messageUseMarkdown: true)
    .chatNavigation(
        title: viewModel.chatTitle,
        status: viewModel.chatStatus,
        cover: viewModel.chatCover
    )
    .onAppear(perform: viewModel.onStart)
    .onDisappear(perform: viewModel.onStop)
    }
}

#Preview {
    PersonalChatView(title: "test")
}
