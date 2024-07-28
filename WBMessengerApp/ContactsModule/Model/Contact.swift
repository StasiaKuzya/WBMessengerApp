//
//  Contact.swift
//  WBMessengerApp
//
//  Created by Анастасия on 28.07.2024.
//

import Foundation

struct Contact: Hashable {
    let id: Int
    let firstName: String
    let lastName: String
    let lastVisit: Date
    let imageName: String?
    let isStory: Bool
    let isOnline: Bool
}
