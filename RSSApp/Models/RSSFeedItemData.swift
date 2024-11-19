//
//  RSSFeedItemData.swift
//  RSSApp
//
//  Created by Matija Pavicic on 12.11.2024..
//

import Foundation

struct RSSFeedItemData: Codable, Identifiable {
    var id: UUID
    var title: String
    var description: String
    var link: String
    var pubDate: Date?
}
