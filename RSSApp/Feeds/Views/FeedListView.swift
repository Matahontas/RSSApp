//
//  FeedListView.swift
//  RSSApp
//
//  Created by Matija Pavicic on 19.11.2024..
//

import SwiftUI

struct FeedListView: View {
    @ObservedObject var feedsVM: FeedsVM
    @State private var isSheetPresented = false
    var isFavoritesView: Bool

    var body: some View {
        List(feedsVM.feeds) { feed in
            if isFavoritesView {
                if feed.favorite == true {
                    if let urlString = feed.imageURL {
                        FeedView(feed: feed, feedsVM: feedsVM) {
                            ImageFeedView(urlString: urlString, feed: feed)
                        }
                    } else {
                        FeedView(feed: feed, feedsVM: feedsVM) {
                            ImagelessFeedView(feed: feed)
                        }
                    }
                }
            } else {
                if let urlString = feed.imageURL {
                    FeedView(feed: feed, feedsVM: feedsVM) {
                        ImageFeedView(urlString: urlString, feed: feed)
                    }
                } else {
                    FeedView(feed: feed, feedsVM: feedsVM) {
                        ImagelessFeedView(feed: feed)
                    }
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle(isFavoritesView ? String.favoriteFeedsTitle : String.feedsTitle)
        .toolbar {
            if !isFavoritesView {
                Button {
                    isSheetPresented = true
                } label: {
                    Label(String.addFeedLabel, systemImage: .addFeedSystemImage)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.white, .black)
                }
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            AddFeedView(feedsVM: feedsVM)
        }
    }
}
