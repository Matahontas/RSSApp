//
//  FeedRowView.swift
//  RSSApp
//
//  Created by Matija Pavicic on 18.11.2024..
//

import SwiftUI

struct FeedView<ChildFeedView: View>: View {
    var feed: RSSFeedData
    @ObservedObject var feedsVM: FeedsVM
    
    @ViewBuilder let childFeedView: ChildFeedView
    
    var body: some View {
        ZStack(alignment: .leading) {
            childFeedView
            CustomNavigationLink(feedItemsView: FeedItemsView(feedsVM: feedsVM, rssURLString: feed.rssURLString, feedItems: feed.feedItems), feedItemsTitle: feed.title)
        }
        .listRowSeparator(.hidden)
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button {
                feedsVM.updateFeedFavorite(feed)
            } label: {
                if let index = feedsVM.feeds.firstIndex(where: { $0 == feed }) {
                    Image(systemName: .favoriteButtonSystemImage)
                        .tint(feedsVM.feeds[index].favorite ? .yellow : .gray)
                }
            }
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
            Button(role: .destructive) {
                feedsVM.removeFeed(feed)
            } label: {
                Image(systemName: .deleteButtonSystemImage)
            }
        }
    }
}
