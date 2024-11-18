//
//  MonthlyFocusTimeViewModel.swift
//  SwiftChartsLearning
//
//  Created by Jan Armbrust on 15/11/24.
//

import SwiftUI

@Observable
class MonthlyFocusTimeViewModel {
    private var sessions: [FocusSession]

    init(sessions: [FocusSession]) {
        self.sessions = sessions
    }

    // Aggregate total focus time per month
    var monthlyFocusTime: [(month: String, totalFocusTime: TimeInterval)] {
        let grouped = Dictionary(grouping: sessions) { session in
            Calendar.current.dateComponents([.year, .month], from: session.date)
        }

        return grouped.map { key, value in
            let totalFocusTime = value.reduce(0) { $0 + $1.focusTime }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM"
            let monthString = dateFormatter.string(from: Calendar.current.date(from: key)!)
            return (monthString, totalFocusTime)
        }
        .sorted { $0.month < $1.month }
    }

    // Static preview data
    static var preview: MonthlyFocusTimeViewModel {
        let sampleSessions = [
            FocusSession(date: Date(), focusTime: 3600, distractions: 1),
            FocusSession(date: Date().addingTimeInterval(-86400 * 30), focusTime: 4200, distractions: 2),
            FocusSession(date: Date().addingTimeInterval(-86400 * 60), focusTime: 4800, distractions: 3),
            FocusSession(date: Date().addingTimeInterval(-86400 * 90), focusTime: 5400, distractions: 4),
            FocusSession(date: Date().addingTimeInterval(-86400 * 120), focusTime: 6000, distractions: 1),
            FocusSession(date: Date().addingTimeInterval(-86400 * 150), focusTime: 6600, distractions: 2),
            FocusSession(date: Date().addingTimeInterval(-86400 * 180), focusTime: 7200, distractions: 3),
            FocusSession(date: Date().addingTimeInterval(-86400 * 210), focusTime: 7800, distractions: 4),
            FocusSession(date: Date().addingTimeInterval(-86400 * 240), focusTime: 8400, distractions: 1),
            FocusSession(date: Date().addingTimeInterval(-86400 * 270), focusTime: 9000, distractions: 2),
            FocusSession(date: Date().addingTimeInterval(-86400 * 300), focusTime: 9600, distractions: 3),
            FocusSession(date: Date().addingTimeInterval(-86400 * 330), focusTime: 10200, distractions: 4),
        ]
        return MonthlyFocusTimeViewModel(sessions: sampleSessions)
    }
}
