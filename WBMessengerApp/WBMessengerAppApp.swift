//
//  WBMessengerAppApp.swift
//  WBMessengerApp
//
//  Created by Анастасия on 05.06.2024.
//

import SwiftUI

@main
struct WBMessengerAppApp: App {
    @StateObject private var appState: AppState
    @StateObject private var router: Router = .init()
    @AppStorage("walkthrough") var walkthrough: Bool = false
    @Environment(\.scenePhase) private var scenePhase
    
    init() {
        let router = Router()
        _router = StateObject(wrappedValue: router)
        _appState = StateObject(wrappedValue: AppState(router: router))
    }
    
    var body: some Scene {
        WindowGroup {
            if appState.isWalkthroughCompleted {
                TabBarView(router: router)
                    .environmentObject(appState)
                    .environmentObject(router)
                    .onOpenURL { url in
                        appState.handle(url: url)
                    }
            } else {
                WalkthroughNavBarView()
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

#Preview {
    WalkthroughNavBarView()
}

#Preview {
    TabBarView(router: Router.init())
}
