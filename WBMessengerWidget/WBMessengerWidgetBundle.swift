//
//  WBMessengerWidgetBundle.swift
//  WBMessengerWidget
//
//  Created by Анастасия on 12.06.2024.
//

import WidgetKit
import SwiftUI

@main
struct WBMessengerWidgetBundle: WidgetBundle {
    var body: some Widget {
        WBMessengerWidget()
        WBMessengerWidgetLiveActivity()
    }
}
