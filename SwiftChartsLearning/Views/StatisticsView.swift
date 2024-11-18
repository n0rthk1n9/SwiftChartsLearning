//
//  StatisticsView.swift
//  SwiftChartsLearning
//
//  Created by Jan Armbrust on 15/11/24.
//

import SwiftUI

struct StatisticsView: View {
    let monthlyDistractions = MonthlyDistractionsViewModel.preview.monthlyDistractions
    let monthlyFocusTime = MonthlyFocusTimeViewModel.preview.monthlyFocusTime
    
    var body: some View {
        VStack {
            MonthlyFocusTimeChartView(monthlyFocusTime: monthlyFocusTime)
                .frame(height: 180)
            MonthlyDistractionsChartView(monthlyDistractions: monthlyDistractions)
                .frame(height: 180)
        }
    }
}

#Preview {
    StatisticsView()
}
