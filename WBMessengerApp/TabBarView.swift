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
    @ObservedObject var router: Router
    
    init(router: Router) {
        self.router = router
        configureTabBarAppearance()
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .wbFontBG2
        appearance.shadowColor = .clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.wbFont]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.wbFont]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $router.selectedTab) {
                tabView(for: .contacts, view: ContactsNavBarView(), image: .asset("contactsTab"))
                tabView(for: .chats, view: Text("tab_chats".localized()), image: .asset("chatsTab"))
                tabView(for: .other, view: Text("tab_other".localized()), image: .system("ellipsis"))
            }
            .tint(.wbDefaultPurple)
            .environmentObject(router)
            
            VStack {
                Spacer()
                Rectangle()
                    .fill(.wbTab)
                    .frame(height: 1)
                    .shadow(color: .black.opacity(1), radius: 14, x: 0, y: -15)
                    .padding(.bottom, 49)
            }
        }
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
    TabBarView(router: Router.init())
}
