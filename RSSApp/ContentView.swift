//
//  ContentView.swift
//  RSSApp
//
//  Created by Matija Pavicic on 05.11.2024..
//

import SwiftUI
import FeedKit

struct ContentView: View {
    @StateObject var feeds = FeedsVM()
    
    var body: some View {
        TabView {
            Tab("Feeds", systemImage: "newspaper") {
                FeedsView(feedsVM: feeds)
            }
            Tab("Favorites", systemImage: "star") {
                FavoriteFeedsView(feedsVM: feeds)
            }
        }
    }
}

#Preview {
    ContentView()
}
