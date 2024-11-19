//
//  CustomNavigationLink.swift
//  RSSApp
//
//  Created by Matija Pavicic on 18.11.2024..
//

import SwiftUI

struct CustomNavigationLink: View {
    var feedItemsView: FeedItemsView
    var feedItemsTitle: String
    
    var body: some View {
        NavigationLink(
            destination: feedItemsView
                .toolbarVisibility(.hidden, for: .tabBar)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(feedItemsTitle)
        ) {
            EmptyView()
        }
        .opacity(0)
    }
}
