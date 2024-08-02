//
//  MockUser.swift
//  WBMessengerApp
//
//  Created by Анастасия on 31.07.2024.
//

import Foundation
import ExyteChat

struct MockUser: Equatable, Hashable, Codable {
    let id: String
    let firstName: String
    let lastName: String
    let lastVisit: Date
    let imageName: String?
    let isStory: Bool
    let isOnline: Bool
}

extension MockUser {
    var isCurrentUser: Bool {
        id == "1"
    }
}

extension MockUser {
    func toChatUser() -> ExyteChat.User {
        ExyteChat.User(id: id, name: "\(firstName) \(lastName.prefix(1))", avatarURL: URL(string: imageName ?? ""), isCurrentUser: isOnline)
    }
}
