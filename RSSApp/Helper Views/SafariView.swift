//
//  SafariView.swift
//  RSSApp
//
//  Created by Matija Pavicic on 13.11.2024..
//
import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    private let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func makeUIViewController(context: Context) -> some SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
