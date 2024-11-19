//
//  FeedView.swift
//  RSSApp
//
//  Created by Matija Pavicic on 18.11.2024..
//

import SwiftUI

struct ImagelessFeedView: View {
    var feed: RSSFeedData

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(feed.title)
                .fontWeight(.bold)
                .font(.headline)
            Text(feed.description)
                .font(.subheadline)
        }
    }
}
