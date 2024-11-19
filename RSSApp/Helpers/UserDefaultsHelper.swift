//
//  UserDefaultsHelper.swift
//  RSSApp
//
//  Created by Matija Pavicic on 12.11.2024..
//

import Foundation

enum UserDefaultsHelper {
    private static let rssFeedDataKey = "rssFeedData"
    
    static var rssFeedData: [RSSFeedData] {
        get {
            guard let data = UserDefaults.standard.data(forKey: rssFeedDataKey) else { return [] }
            do {
                let decoder = JSONDecoder()
                let rssFeedData = try decoder.decode([RSSFeedData].self, from: data)
                return rssFeedData
            } catch {
                print(error)
                return []
            }
        }
        set {
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(newValue)
                UserDefaults.standard.set(data, forKey: rssFeedDataKey)
            } catch {
                print(error)
            }
        }
    }
    
    static func removeFeedData(_ feedData: RSSFeedData) {
        var currentData = rssFeedData
        currentData.removeAll { $0 == feedData }
        rssFeedData = currentData
    }
}

//    func setRSSFeedData(_ rssFeedData: RSSFeedData) {
//        do {
//            let encoder = JSONEncoder()
//            let data = try encoder.encode(rssFeedData)
//            UserDefaults.standard.set(data, forKey: "rssFeedData")
//        } catch {
//            print(error)
//        }
//    }
//
//    func getRSSFeedData(completion: @escaping (RSSFeedData) -> ()) {
//        guard let data = UserDefaults.standard.data(forKey: "rssFeedData") else { return }
//        do {
//            let decoder = JSONDecoder()
//            let rssFeedData = try decoder.decode(RSSFeedData.self, from: data)
//            completion(rssFeedData)
//        } catch {
//            print(error)
//        }
//    }
