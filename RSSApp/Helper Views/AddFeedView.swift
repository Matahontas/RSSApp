//
//  AddFeedView.swift
//  RSSApp
//
//  Created by Matija Pavicic on 08.11.2024..
//

import SwiftUI

struct AddFeedView: View {
    @State private var rssFeedURL = ""
    @State private var alreadyStored = false
    @ObservedObject var feedsVM: FeedsVM
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        HStack {
            TextField(String.addNewFeedPlaceholder, text: $rssFeedURL)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .padding()
            
            Button(String.addFeedLabel) {
                feedsVM.fetchFeeds(rssFeedURL) { stored in
                    alreadyStored = stored
                    if(!alreadyStored) {
                        dismiss()
                    }
                }
                rssFeedURL = ""
            }
            .alert(String.alreadyStoredAlert, isPresented: $alreadyStored) {
                Button("OK", role: .cancel) {
                    print("OK in feed already stored is tapped")
                }
            }
        }
        .padding()
    }
}

#Preview {
    AddFeedView(feedsVM: FeedsVM())
}
