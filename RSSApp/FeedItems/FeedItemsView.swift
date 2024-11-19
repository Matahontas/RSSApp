//
//  FeedItemsView.swift
//  RSSApp
//
//  Created by Matija Pavicic on 05.11.2024..
//

import SwiftUI
import FeedKit

struct FeedItemsView: View {
    @State private var selectedItem: String = ""
    @State private var isSheetPresented = false
    @State private var searchableText: String = ""
    @ObservedObject var feedsVM: FeedsVM
    var rssURLString: String

    @State var feedItems: [RSSFeedItemData]
    
    private var searchResults: [RSSFeedItemData] {
        if searchableText.isEmpty {
            return feedItems
        } else {
            return feedItems.filter { $0.title.contains(searchableText) || $0.description.contains(searchableText) }
        }
    }
    
    var body: some View {
        List(searchResults) { item in
            VStack(alignment: .leading, spacing: 8) {
                Text(item.title)
                    .font(.headline)
                if let dateToDisplay = DateHelper.formatDateString(item.pubDate?.description ?? "") {
                    Text(dateToDisplay)
                        .font(.footnote)
                }
                Text(item.description)
                    .font(.subheadline)
                    .lineLimit(5)
            }
            .onTapGesture {
                selectedItem = item.link
                isSheetPresented = true
            }
        }
        .listStyle(.plain)
        .sheet(isPresented: $isSheetPresented) {
            if let url = URL(string: selectedItem) {
                SafariView(url: url)
            }
        }
        .searchable(text: $searchableText)
        .refreshable {
            feedsVM.refreshFeed(rssURLString) { feedItems in
                self.feedItems = feedItems
            }
        }
    }
}
