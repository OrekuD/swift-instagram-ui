//
//  ContentView.swift
//  InstagramClone
//
//  Created by Cyboticx LLC on 14/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: Tab;
    
    init() {
        UITabBar.appearance().isHidden = true
        selectedTab = .home
    }
    
    @ViewBuilder
    func getScreen (screen: Tab) -> some View {
        switch screen {
        case .home:
            HomeView()
        case .search:
            SearchView()
        case .reels:
            ReelsView()
        case .shop:
            ShopView()
        case .profile:
            ProfileView()
        }
    }
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) {
                        tab in getScreen(screen: tab).tag(tab)
                    }
                }
                CustomTabView(selectedTab: $selectedTab)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
