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
    }
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            ContactsNavBarView()
                .tabItem {
                    Image("contactsTab")
                        .renderingMode(.template)
                        .foregroundStyle(.wbFont)
                }
                .tag(Tabs.contacts)
            
            Text("Чаты")
                .tabItem {
                    Image("chatsTab")
                        .renderingMode(.template)
                        .foregroundStyle(.wbFont)
                }
                .tag(Tabs.chats)
            
            Text("Другие")
                .tabItem {
                    Image(systemName: "ellipsis")
                }
                .tag(Tabs.other)
        }
        .tint(.wbDefaultPurple)
    }
}

#Preview {
    TabBarView()
}
