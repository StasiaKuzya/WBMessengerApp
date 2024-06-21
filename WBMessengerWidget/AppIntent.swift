//
//  AppIntent.swift
//  WBMessengerWidget
//
//  Created by Анастасия on 12.06.2024.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
//    @Parameter(title: "Chats", default: "💬")
//    var favoriteEmoji: String
}
