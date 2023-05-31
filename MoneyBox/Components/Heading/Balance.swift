//
//  Balance.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 18/04/23.
//

import SwiftUI
import SwiftUICharts

private var valute: String = "$"

public struct Balance: View {
    let balance: String
    let income: String
    let expense: String
    
    public var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 10) {
                Text(balance + valute)
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(Color("text"))
                
                VStack(spacing: 3) {
                    Text(income + valute)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color("income"))
                    Text(expense + valute)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color("expense"))
                }
            }.padding()
            Spacer()
            chart.init()
        }
        .padding()
    }
}

private struct chart: View {
    var demoData: [Double] = [8, 2, 4]
    
    var body: some View {
        Button(
            action: {
            // Todo
            }
        ){
            ZStack {
                PieChart()
                    .data(demoData)
                    .chartStyle(
                        ChartStyle(
                            backgroundColor: Color("background"),
                            foregroundColor: [
                                ColorGradient(Color("ColorA")),
                                ColorGradient(Color("ColorB")),
                                ColorGradient(Color("ColorC")),
                            ]
                        )
                    )
                    .frame(width: 160, height: 160)
                Circle()
                    .frame(height: 120)
                    .foregroundColor(Color("background"))
                Image("iconSettings")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color("text"))
            }
        }
    }
}
