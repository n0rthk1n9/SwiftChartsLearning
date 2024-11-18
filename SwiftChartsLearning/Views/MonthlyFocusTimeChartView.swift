//
//  MonthlyFocusTimeChartView.swift
//  SwiftChartsLearning
//
//  Created by Jan Armbrust on 15/11/24.
//

import SwiftUI
import Charts

struct MonthlyFocusTimeChartView: View {
    let monthlyFocusTime: [(month: String, totalFocusTime: TimeInterval)]

    var body: some View {
        Chart(monthlyFocusTime, id: \.month) { data in
            BarMark(
                x: .value("Month", data.month),
                y: .value("Total Focus Time", data.totalFocusTime / 3600) // Convert to hours
            )
        }
        .chartYAxisLabel("Hours")
    }
}

#Preview {
    MonthlyFocusTimeChartView(monthlyFocusTime: MonthlyFocusTimeViewModel.preview.monthlyFocusTime)
        .aspectRatio(1, contentMode: .fit)
        .padding()
}
