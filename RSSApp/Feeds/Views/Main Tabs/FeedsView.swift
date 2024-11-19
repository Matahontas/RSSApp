//
//  FeedsView.swift
//  RSSApp
//
//  Created by Matija Pavicic on 05.11.2024..
//

import SwiftUI
import asnycImage

struct FeedsView: View {
    @ObservedObject var feedsVM: FeedsVM
    
    var body: some View {
        NavigationStack {
            FeedListView(feedsVM: feedsVM, isFavoritesView: false)
        }
    }
}

#Preview {
    FeedsView(feedsVM: FeedsVM())
}
