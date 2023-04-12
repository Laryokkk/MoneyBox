//
//  ContentView.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 11/04/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var body: some View {
        VStack {
            headingComponent
            transactionsComponent
            //            Spacer()
        }.padding([.leading, .trailing], 24) .background(Color("background"))
    }
}

var headingComponent: some View {
    // Todo: add some more sections
    
    balanceComponent
}

var balanceComponent: some View {
    HStack(alignment: .center) {
        VStack(alignment: .leading, spacing: 10) {
            Text("172,20$")
                .font(.system(size: 38, weight: .bold))
                .foregroundColor(Color("text"))
            VStack(spacing: 3) {
                Text("363,20$")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color("income"))
                Text("120,00$")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color("expense"))
            }
        }.padding()
        Spacer()
        transactionsChart.init()
        
    }.padding([.bottom], 24)
}

struct transactionsChart: View {
    var demoData: [Double] = [8, 2, 4]
    
    var body: some View {
        Button(action: {
            // Todo
        }) {
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

var transactionsComponent: some View {
    ScrollView(.vertical, showsIndicators: false) {
        VStack {
            ForEach(transactionCollection) { transactionDay in
                transactionDay
            }
        }
    }
}

struct TransactionDay: View, Identifiable {
    var id: String {
        uuid
    }
    
    let uuid: String
    let separator: TransactionSeparator
    let transactionsCollection: [TransactionElement]
    
    var body: some View {
        VStack {
            separator
            ForEach(transactionsCollection) { transaction in
                transaction
            }
        }
    }
}

struct TransactionSeparator: View {
    let title: String
    let theme: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(
                    size: 18,
                    weight: .regular
                ))
                .foregroundColor(Color("textExtend"))
            Spacer()
            Rectangle()
                .frame(width: 260, height: 2)
                .foregroundColor(Color("text"))
        }
    }
}

struct TransactionElement: View, Identifiable {
    var id: String {
        uuid
    }
    
    let uuid: String
    let icon: String
    let amount: String
    let category: String
    
    var body: some View {
        HStack {
            ZStack(alignment: .center) {
                Rectangle()
                    .frame(width: 48, height: 48)
                    .cornerRadius(15)
                    .foregroundColor(Color("transactionBox"))
                Text(icon)
                    .font(.system(size: 28))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(category)
                    .foregroundColor(Color("textExtend"))
                HStack {
                    ZStack{
                        Circle().frame(width: 14)
                        Circle().frame(width: 6).foregroundColor(Color("background"))
                    }
                    ZStack{
                        Circle().frame(width: 14)
                        Circle().frame(width: 6).foregroundColor(Color("background"))
                    }
                }
            }
            Spacer()
            Text("\(amount)$").foregroundColor(Color("text")).font(.system(
                size: 20,
                weight: .bold
            ))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let transactionCollection: [TransactionDay] = [
    .init(
        uuid: "213-dssdf3",
        separator: TransactionSeparator.init(title: "Today", theme: "Good"),
        transactionsCollection: [
            TransactionElement.init(uuid: "213-dsf3", icon: "🥃", amount: "24,56", category: "Gamdasdes"),
            TransactionElement.init(uuid: "213-ds23", icon: "✈️", amount: "24,56", category: "Games")
        ]
    ),
    .init(
        uuid: "213-3oif3",
        separator: TransactionSeparator.init(title: "04 April", theme: "Good"),
        transactionsCollection: [
            TransactionElement.init(uuid: "213-dsf3", icon: "🥃", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-dsf3", icon: "✈️", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-dsf3", icon: "🥃", amount: "24,56", category: "Gamsdases"),
            TransactionElement.init(uuid: "213-ds23", icon: "✈️", amount: "24,56", category: "Games")
        ]
    ),
    .init(
        uuid: "213-3oi3",
        separator: TransactionSeparator.init(title: "03 April", theme: "Good"),
        transactionsCollection: [
            TransactionElement.init(uuid: "213-dsf3", icon: "✈️", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-dsf3", icon: "🥃", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-dsf3", icon: "🥃", amount: "24,56", category: "Gadsadmes"),
            TransactionElement.init(uuid: "213-dsf3", icon: "🥃", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-dsf3", icon: "✈️", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-dsf3", icon: "✈️", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-ds23", icon: "✈️", amount: "24,56", category: "Games")
        ]
    )
]
