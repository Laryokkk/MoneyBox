//
//  ContentView.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            headingComponent
            transactionsComponent
            Spacer()
        }.padding(24)
    }
}

var headingComponent: some View {
    // Todo: add some more sections
    
    balanceComponent
}

var balanceComponent: some View {
    HStack {
        VStack {
            Text("172,20$").font(.system(size: 32, weight: .bold))
            Text("363,20$").font(.system(size: 20, weight: .regular))
            Text("120,00$").font(.system(size: 20, weight: .regular))
        }
        Spacer()
        Ellipse()
            .frame(width: 120, height: 160)
            .foregroundColor(.black)
    }
}

var transactionsComponent: some View {
    VStack {
        ForEach(transactionCollection) { transactionDay in
            transactionDay
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
            Rectangle()
                .frame(width: 260, height: 2)
                .foregroundColor(.black)
            Spacer()
            Text(title)
                .font(.system(
                    size: 18,
                    weight: .regular
                ))
                .foregroundColor(.gray)
        }
    }
}

struct TransactionElement: View, Identifiable {
    var id: String {
        uuid
    }
    
    let uuid: String
    //    let icon: Image
    let amount: String
    let category: String
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 48, height: 48)
                .foregroundColor(.black)
            VStack {
                Text("\(amount)$")
                Text(category)
                    .foregroundColor(.gray)
            }
            Spacer()
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
            TransactionElement.init(uuid: "213-dsf3", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-ds23", amount: "24,56", category: "Games")
        ]
    ),
    .init(
        uuid: "213-3oif3",
        separator: TransactionSeparator.init(title: "04 April", theme: "Good"),
        transactionsCollection: [
            TransactionElement.init(uuid: "213-dsf3", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-dsf3", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-dsf3", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-ds23", amount: "24,56", category: "Games")
        ]
    )
]
