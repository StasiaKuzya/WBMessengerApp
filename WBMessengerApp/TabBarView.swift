//
//  TabBarView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 08.06.2024.
//

import SwiftUI

enum Tabs: Hashable {
    case contacts
    case chats
    case other
}

enum TabImage {
    case asset(String)
    case system(String)
}

final class Router: ObservableObject {
    @Published var selectedTab: Tabs = .contacts
}

struct TabBarView: View {
    @StateObject var router: Router = .init()
    
    init() {
        configureTabBarAppearance()
    }
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            tabView(for: .contacts, view: ContactsNavBarView(), image: .asset("contactsTab"))
            tabView(for: .chats, view: Text("Чаты"), image: .asset("chatsTab"))
            tabView(for: .other, view: Text("Другие"), image: .system("ellipsis"))
        }
        .tint(.wbDefaultPurple)
        .environmentObject(router)
    }
    
    private func tabView<Content: View>(for tab: Tabs, view: Content, image: TabImage) -> some View {
        view
            .tabItem {
                switch image {
                case .asset(let imageName):
                    Image(imageName)
                        .renderingMode(.template)
                        .foregroundStyle(.wbFont)
                case .system(let systemName):
                    Image(systemName: systemName)
                        .renderingMode(.template)
                        .foregroundStyle(.wbFont)
                }
            }
            .tag(tab)
    }
    
    private func configureTabBarAppearance() {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.backgroundColor = .wbTab
        tabBarAppearance.unselectedItemTintColor = .wbFont
    }
}

#Preview {
    TabBarView()
}
