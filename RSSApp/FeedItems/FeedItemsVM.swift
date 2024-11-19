//
//  FeedItemsVM.swift
//  RSSApp
//
//  Created by Matija Pavicic on 06.11.2024..
//

import Foundation
import FeedKit

class FeedItemsVM: ObservableObject {
    private let rssParser = RSSParser()
    @Published var feedItems: [RSSFeedItem] = []
    
    func fetchFeedItems(_ url: String) {
        rssParser.parseFeedItems(url: url) { items in
            DispatchQueue.main.async {
                self.feedItems = items
            }
        }
    }
}
