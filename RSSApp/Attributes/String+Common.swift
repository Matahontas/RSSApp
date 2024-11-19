//
//  String+Common.swift
//  RSSApp
//
//  Created by Matija Pavicic on 19.11.2024..
//

import Foundation

extension String {
    static let feedsTitle = NSLocalizedString("Feeds", comment: "Feeds navigation title")
    static let favoriteFeedsTitle = NSLocalizedString("Favorite Feeds", comment: "Favorite feeds navigation title")
    static let addFeedLabel = NSLocalizedString("Add Feed", comment: "Add feed label")
    static let addFeedSystemImage = NSLocalizedString("plus.circle.fill", comment: "Add feed system image")
    static let favoriteButtonSystemImage = NSLocalizedString("star.fill", comment: "Favorite button system image")
    static let deleteButtonSystemImage = NSLocalizedString("trash.fill", comment: "Delete button system image")
    static let addNewFeedPlaceholder = NSLocalizedString("Enter RSS feed URL here", comment: "Add new feed placeholder")
    static let alreadyStoredAlert = NSLocalizedString("That feed is already stored!", comment: "Feed already stored alert")
}
