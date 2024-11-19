//
//  FeedView.swift
//  RSSApp
//
//  Created by Matija Pavicic on 18.11.2024..
//

import SwiftUI
import asnycImage

struct ImageFeedView: View {
    var urlString: String
    var feed: RSSFeedData
    
    var body: some View {
        HStack(spacing: 8) {
            CAsyncImage(urlString: urlString) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(feed.title)
                    .fontWeight(.bold)
                    .font(.headline)
                    .lineLimit(1)
                Text(feed.description)
                    .font(.subheadline)
                    .lineLimit(3)
            }
            .padding()
        }
    }
}
