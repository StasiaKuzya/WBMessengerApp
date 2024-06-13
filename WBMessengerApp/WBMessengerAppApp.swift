//
//  WBMessengerAppApp.swift
//  WBMessengerApp
//
//  Created by Анастасия on 05.06.2024.
//

import SwiftUI

@main
struct WBMessengerAppApp: App {
    @StateObject private var appState = AppState()
    @StateObject private var router = Router()
    @AppStorage("walkthrough") var walkthrough: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if appState.isWalkthroughCompleted {
                TabBarView()
                    .environmentObject(appState)
                    .environmentObject(router)
                    .onOpenURL { url in
                        appState.handle(url: url)
                    }
            } else {
                WalkthroughView()
                    .environmentObject(appState)
                    .onOpenURL { url in
                        appState.handle(url: url)
                    }
            }
        }
    }
}

final class AppState: ObservableObject {
    @Published var selectedChatID: String?
    @Published var isWalkthroughCompleted: Bool = UserDefaults.standard.bool(forKey: "walkthroughCompleted")
    
    func handle(url: URL) {
        print("Handling URL: \(url)")
        guard url.scheme == "mymessenger", url.host == "chat" else {
            print("Invalid URL scheme or host")
            return
        }
        
        guard let id = url.pathComponents.last else {
            print("No chat ID found in URL")
            return
        }
        
        print("Selected chat ID: \(id)")
        selectedChatID = id
    }
}

//struct WBMessengerAppApp: App {
//    var body: some Scene {
//        WindowGroup {
//            WalkthroughView()
//        }
//    }
//}

#Preview {
    WalkthroughView()
}
