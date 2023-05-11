//
//  CurrentDate.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 11/5/23.
//

import Foundation

extension Date {
    var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        return formatter.string(from: self)
    }
}
