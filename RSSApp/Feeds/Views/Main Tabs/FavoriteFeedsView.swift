//
//  FavoriteFeedsView.swift
//  RSSApp
//
//  Created by Matija Pavicic on 15.11.2024..
//

import SwiftUI

struct FavoriteFeedsView: View {
    @ObservedObject var feedsVM: FeedsVM
    var body: some View {
        NavigationStack {
            FeedListView(feedsVM: feedsVM, isFavoritesView: true)
        }
    }
}

#Preview {
    FavoriteFeedsView(feedsVM: FeedsVM())
}
