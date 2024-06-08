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

final class Router: ObservableObject {
    @Published var selectedTab: Tabs = .contacts
}

struct TabBarView: View {
    @StateObject var router: Router = .init()
    
    init() {
        UITabBar.appearance().backgroundColor = .wbTab
        UITabBar.appearance().unselectedItemTintColor = .wbFont
        UITabBar.appearance().tintColor = .wbFont
     }
    var body: some View {
        TabView(selection: $router.selectedTab) {
            ContactsNavBarView()
                .tabItem {
                    if router.selectedTab == .contacts {
                    Label("Контакты", systemImage: "person.2")
                    } else {
                        Image(systemName: "person.2")
                    }
                }
                .tag(Tabs.contacts)

            Text("Чаты")
                .tabItem {
                    if router.selectedTab == .chats {
                        Label("Чаты", systemImage: "bubble")
                    } else {
                        Image(systemName: "bubble")
                    }
                }
                .tag(Tabs.chats)

            Text("Другие")
                .tabItem {
                    if router.selectedTab == .other {
                        Label("Ещё", systemImage: "ellipsis")
                    } else {
                        Image(systemName: "ellipsis")
                    }
                }
                .tag(Tabs.other)
        }
        .tint(.wbFont)
    }
}

#Preview {
    TabBarView()
}
