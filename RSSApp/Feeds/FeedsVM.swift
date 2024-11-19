//
//  FeedsVM.swift
//  RSSApp
//
//  Created by Matija Pavicic on 07.11.2024..
//

import Foundation
import FeedKit

class FeedsVM: ObservableObject {
    private let rssParser = RSSParser()
    @Published var feeds: [RSSFeedData] = UserDefaultsHelper.rssFeedData
    
    func fetchFeeds(_ url: String, completion: @escaping (Bool) -> Void) {
        rssParser.parseFeed(url: url) { [weak self] feed in
            guard let self = self else { return }
            if(UserDefaultsHelper.rssFeedData.contains(feed)) {
                completion(true)
            } else {
                UserDefaultsHelper.rssFeedData.append(feed)
                DispatchQueue.main.async {
                    self.feeds.append(feed)
                }
                completion(false)
            }
        }
    }
    
    func refreshFeed(_ url: String, completion: @escaping ([RSSFeedItemData]) -> Void) {
        rssParser.parseFeed(url: url) { feed in
            DispatchQueue.main.async {
                completion(feed.feedItems)
            }
        }
    }
    
    func removeFeed(_ feed: RSSFeedData) {
        feeds.removeAll { $0 == feed }
        UserDefaultsHelper.removeFeedData(feed)
    }
    
    
    func updateFeedFavorite(_ feed: RSSFeedData) {
        if let index = feeds.firstIndex(where: { $0 == feed}) {
            feeds[index].favorite.toggle()
            
            if let userDefaultsIndex = UserDefaultsHelper.rssFeedData.firstIndex(where: { $0 == feed }) {
                UserDefaultsHelper.rssFeedData[userDefaultsIndex].favorite.toggle()
            }
        }
        
    }
}
