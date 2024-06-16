//
//  OpenChatIntent.swift
//  WBMessengerApp
//
//  Created by Анастасия on 16.06.2024.
//

import SwiftUI
import AppIntents

struct OpenChatIntent: AppIntent {
    static var title: LocalizedStringResource = "Open Chat"
    static var description = IntentDescription("Opens a specific chat")

    @Parameter(title: "Contact Name")
    var contactName: String

    func perform() async throws -> some IntentResult {
        if let url = URL(string: "mymessenger://chats") {
            if await UIApplication.shared.canOpenURL(url) {
                await UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        return .result()
    }
}
