//
//  AppState.swift
//  WBMessengerApp
//
//  Created by Анастасия on 16.06.2024.
//

import Foundation

final class AppState: ObservableObject {
    @Published var selectedChatID: String?
    @Published var isWalkthroughCompleted: Bool = false {
        didSet {
            UserDefaults(suiteName: "group.com.mymessenger")?.set(isWalkthroughCompleted, forKey: "isWalkthroughCompleted")
        }
    }
    
    private var router: Router
    
    init(router: Router) {
        self.router = router
        self.isWalkthroughCompleted = UserDefaults(suiteName: "group.com.mymessenger")?.bool(forKey: "isWalkthroughCompleted") ?? false
    }
    
    func setRouter(_ router: Router) {
        self.router = router
    }
    
    func handle(url: URL) {
        print("Handling URL: \(url)")
        guard url.scheme == "mymessenger" else {
            print("Invalid URL scheme")
            return
        }
        if url.host == "chats" {
            print("router chats \(String(describing: router.selectedTab))")
            router.selectedTab = .chats
            print("router chats \(String(describing: router.selectedTab))")
            
        } else if url.host == "chat", let id = url.pathComponents.last {
            selectedChatID = id
        } else {
            print("Invalid URL host")
        }
    }
}
