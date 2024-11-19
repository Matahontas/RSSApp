//
//  RSSParser.swift
//  RSSApp
//
//  Created by Matija Pavicic on 05.11.2024..
//

import Foundation
import FeedKit

//http://images.apple.com/main/rss/hotnews/hotnews.rss
//https://www.wired.com/feed/rss
//https://www.theguardian.com/world/rss
//https://www.dailymail.co.uk/home/index.rss

class RSSParser {
    func parseFeed(url: String, completion: @escaping (RSSFeedData) -> Void) {
        guard let feedURL = URL(string: url) else { return }
        let parser = FeedParser(URL: feedURL)
        
        parser.parseAsync { result in
//            guard let self = self else { return }
            switch result {
            case .success(let feed):
                guard let rssFeed = feed.rssFeed else { return }
                var rssFeedItemData: [RSSFeedItemData] = []
                guard let feedItems = rssFeed.items else { return }
                for feed in feedItems {
                    let data = RSSFeedItemData(id: UUID(), title: feed.title ?? "", description: feed.description ?? "", link: feed.link ?? "", pubDate: feed.pubDate)
                    rssFeedItemData.append(data)
                }
                let rssFeedData = RSSFeedData(id: UUID(), title: rssFeed.title ?? "", description: rssFeed.description ?? "", imageURL: rssFeed.image?.url ?? "", feedItems: rssFeedItemData, favorite: false, rssURLString: url)
                
                completion(rssFeedData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func parseFeedItems(url: String, completion: @escaping ([RSSFeedItem]) -> Void) {
        guard let feedURL = URL(string: url) else { return }
        let parser = FeedParser(URL: feedURL)
        
        parser.parseAsync { result in
//            guard let self = self else { return }
            switch result {
            case .success(let feed):
                guard let rssItems = feed.rssFeed?.items else { return }
                completion(rssItems)
                
            case .failure(let error):
                completion([])
                print(error)
            }
        }
    }
}
