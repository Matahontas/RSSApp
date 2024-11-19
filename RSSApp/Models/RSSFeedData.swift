//
//  RSSFeedData.swift
//  RSSApp
//
//  Created by Matija Pavicic on 12.11.2024..
//

import Foundation

struct RSSFeedData: Codable, Identifiable, Equatable {
    static func == (lhs: RSSFeedData, rhs: RSSFeedData) -> Bool {
        lhs.title == rhs.title
    }
    
    var id: UUID
    var title: String
    var description: String
    var imageURL: String?
    var feedItems: [RSSFeedItemData]
    var favorite: Bool
    var rssURLString: String
}
