//
//  MainTabView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/9/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }

            WishlistView()
                .tabItem {
                    Label("Wishlists", systemImage: "heart.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()

            UITabBar.appearance().standardAppearance = appearance
        }

        .tint(.pink)
    }
}

#Preview {
    MainTabView()
}
