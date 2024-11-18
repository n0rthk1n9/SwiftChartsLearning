//
//  MonthlyDistractionsChartView.swift
//  SwiftChartsLearning
//
//  Created by Jan Armbrust on 15/11/24.
//

import SwiftUI
import Charts

struct MonthlyDistractionsChartView: View {
    let monthlyDistractions: [(month: String, totalDistractions: Int)]

    var body: some View {
        Chart(monthlyDistractions, id: \.month) { data in
            LineMark(
                x: .value("Month", data.month),
                y: .value("Distractions", data.totalDistractions)
            )
        }
        .chartYAxisLabel("Distractions")
    }
}

#Preview {
    MonthlyDistractionsChartView(monthlyDistractions: MonthlyDistractionsViewModel.preview.monthlyDistractions)
        .aspectRatio(1, contentMode: .fit)
        .padding()
}
