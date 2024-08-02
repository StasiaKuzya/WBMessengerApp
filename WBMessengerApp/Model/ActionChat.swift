//
//  ActionChat.swift
//  WBMessengerApp
//
//  Created by Анастасия on 02.08.2024.
//

import SwiftUI
import Foundation
import ExyteChat

enum ActionChat: MessageMenuAction {
    case reply, delete

    func title() -> String {
        switch self {
        case .reply:
            "Reply"
        case .delete:
            "Delete"
        }
    }
    
    func icon() -> Image {
        switch self {
        case .reply:
            Image(systemName: "arrowshape.turn.up.left")
        case .delete:
            Image(systemName: "xmark.bin.fill")
        }
    }
}
