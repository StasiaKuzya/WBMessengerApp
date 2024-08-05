//
//  ChatViewModel.swift
//  WBMessengerApp
//
//  Created by Анастасия on 31.07.2024.
//

import Foundation
import Combine
import ExyteChat

final class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var replyToMessage: ReplyMessage?
    
//    var chatTitle: String {
//        interactor.otherSenders.count == 1 ? interactor.otherSenders.first!.firstName : "Group chat"
//    }
//    var chatStatus: String {
//        interactor.otherSenders.count == 1 ? "online" : "\(interactor.senders.count) members"
//    }
//    var chatCover: URL? {
//        interactor.otherSenders.count == 1 ? URL(string: "\(interactor.otherSenders.first!.imageName)") : nil
//    }

    private let interactor: ChatInteractorProtocol
    private var subscriptions = Set<AnyCancellable>()

    init(interactor: ChatInteractorProtocol = MockChatInteractor()) {
        self.interactor = interactor
    }
    func send(draft: DraftMessage, replyToMessage: ReplyMessage?) {
        interactor.send(draftMessage: draft, replyToMessage: replyToMessage)
    }
    
    func onStart() {
        interactor.messages
            .compactMap { messages in
                messages.map { $0.toChatMessage() }
            }
            .assign(to: &$messages)

        interactor.connect()
    }

    func onStop() {
        interactor.disconnect()
    }

    func loadMoreMessage(before message: Message) {
        interactor.loadNextPage()
            .sink { _ in }
            .store(in: &subscriptions)
    }
}
