//
//  MonthlyDistractionsViewModel.swift
//  SwiftChartsLearning
//
//  Created by Jan Armbrust on 15/11/24.
//

import SwiftUI

@Observable
class MonthlyDistractionsViewModel {
    private var sessions: [FocusSession]

    init(sessions: [FocusSession]) {
        self.sessions = sessions
    }

    // Aggregate distractions per month
    var monthlyDistractions: [(month: String, totalDistractions: Int)] {
        let grouped = Dictionary(grouping: sessions) { session in
            Calendar.current.dateComponents([.year, .month], from: session.date)
        }

        return grouped.map { key, value in
            let totalDistractions = value.reduce(0) { $0 + $1.distractions }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM"
            let monthString = dateFormatter.string(from: Calendar.current.date(from: key)!)
            return (monthString, totalDistractions)
        }
        .sorted { $0.month < $1.month }
    }

    // Static preview data
    static var preview: MonthlyDistractionsViewModel {
        let sampleSessions = [
            FocusSession(date: Date(), focusTime: 3600, distractions: 3),
            FocusSession(date: Date().addingTimeInterval(-86400 * 30), focusTime: 1800, distractions: 5),
            FocusSession(date: Date().addingTimeInterval(-86400 * 60), focusTime: 2700, distractions: 4),
            FocusSession(date: Date().addingTimeInterval(-86400 * 90), focusTime: 3600, distractions: 3),
            FocusSession(date: Date().addingTimeInterval(-86400 * 120), focusTime: 1800, distractions: 5),
            FocusSession(date: Date().addingTimeInterval(-86400 * 150), focusTime: 2700, distractions: 4),
            FocusSession(date: Date().addingTimeInterval(-86400 * 180), focusTime: 3600, distractions: 3),
            FocusSession(date: Date().addingTimeInterval(-86400 * 210), focusTime: 1800, distractions: 5),
            FocusSession(date: Date().addingTimeInterval(-86400 * 240), focusTime: 2700, distractions: 4),
            FocusSession(date: Date().addingTimeInterval(-86400 * 270), focusTime: 3600, distractions: 3),
            FocusSession(date: Date().addingTimeInterval(-86400 * 300), focusTime: 1800, distractions: 5),
            FocusSession(date: Date().addingTimeInterval(-86400 * 330), focusTime: 2700, distractions: 4),
        ]
        return MonthlyDistractionsViewModel(sessions: sampleSessions)
    }
}
