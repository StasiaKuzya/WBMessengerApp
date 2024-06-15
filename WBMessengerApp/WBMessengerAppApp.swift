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
    @Environment(\.scenePhase) private var scenePhase
    
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
        .onChange(of: scenePhase) { oldValue, newValue in
            if newValue == .background {
                DataManager.shared.saveLastExitDate(Date())
            }
        }
    }
}

final class AppState: ObservableObject {
    @Published var selectedChatID: String?
    @Published var isWalkthroughCompleted: Bool = false {
         didSet {
             UserDefaults(suiteName: "group.com.yourcompany.messenger")?.set(isWalkthroughCompleted, forKey: "isWalkthroughCompleted")
         }
     }
     
     init() {
         self.isWalkthroughCompleted = UserDefaults(suiteName: "group.com.yourcompany.messenger")?.bool(forKey: "isWalkthroughCompleted") ?? false
     }
    
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

#Preview {
    WalkthroughView()
}

#Preview {
    TabBarView()
}
