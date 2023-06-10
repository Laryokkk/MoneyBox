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
            Spacer()
            Text(balance + valute)
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(Color("text"))
            Spacer()
            Spacer()
            VStack(spacing: 6) {
                Text(income + valute)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color("income"))
                Text(expense + valute)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color("expense"))
            }
            Spacer()
        }.padding()
    }
}
