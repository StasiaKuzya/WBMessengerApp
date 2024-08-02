//
//  ChatInteractorProtocol.swift
//  WBMessengerApp
//
//  Created by Анастасия on 31.07.2024.
//

import Foundation
import Combine
import ExyteChat

protocol ChatInteractorProtocol {
    var messages: AnyPublisher<[MockMessage], Never> { get }
    var senders: [MockUser] { get }
    var otherSenders: [MockUser] { get }

    func send(draftMessage: ExyteChat.DraftMessage, replyToMessage: ExyteChat.ReplyMessage?)

    func connect()
    func disconnect()

    func loadNextPage() -> Future<Bool, Never>
}
