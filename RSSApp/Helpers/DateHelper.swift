//
//  DateHelper.swift
//  RSSApp
//
//  Created by Matija Pavicic on 19.11.2024..
//

import Foundation

enum DateHelper {
    static func formatDateString(_ dateString: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        
        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd.MM.yyyy. HH:mm"
            return outputFormatter.string(from: date)
        }
        return nil
    }
}
