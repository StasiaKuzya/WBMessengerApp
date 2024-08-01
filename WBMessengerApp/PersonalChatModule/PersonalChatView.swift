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
    
    init(viewModel: ChatViewModel = ChatViewModel(), title: String) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.title = title
    }
    
    var body: some View {
        ChatView(messages: viewModel.messages, chatType: .conversation) { draft in
            viewModel.send(draft: draft)
        } messageBuilder: { message, positionInUserGroup, positionInCommentsGroup, showContextMenuClosure, messageActionClosure, showAttachmentClosure in
            ZStack {
                Color.wbFontBG.ignoresSafeArea()
                VStack {
                    if message.user.id == "1" {
                        HStack {
                            Spacer()
                            SentMessageView(message: message)
                        }
                    } else {
                        HStack {
                            RecievedMessageView(message: message)
                            Spacer()
                        }
                    }
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
            }
        } inputViewBuilder: { textBinding, attachments, inputViewState, inputViewStyle, inputViewActionClosure, dismissKeyboardClosure in
            Group {
                InputView(textBinding: textBinding,
                          plusAction: { inputViewActionClosure(.photo) },
                          sendAction: { inputViewActionClosure(.send) })
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
