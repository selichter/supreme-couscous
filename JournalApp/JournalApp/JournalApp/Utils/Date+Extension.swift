//
//  Date+Extension.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

