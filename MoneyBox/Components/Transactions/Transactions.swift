//
//  Transactions.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 18/04/23.
//

import SwiftUI

public struct Transactions: View {
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(transactionCollection) { transactionDay in
                    transactionDay
                }
            }
        }.padding([.leading, .trailing])
    }
}

private let transactionCollection: [Group] = [
    .init(
        uuid: "213-dssdf3",
        separator: Separator.init(title: "Today"),
        transactionsCollection: [
            Transaction.init(uuid: "1", icon: "🥃", amount: "18,50", category: "Bar", type: "expense"),
            Transaction.init(uuid: "2", icon: "✈️", amount: "250,00", category: "Travel", type: "expense")
        ]
    ),
    .init(
        uuid: "213-3oif3",
        separator: Separator.init(title: "04 April"),
        transactionsCollection: [
            Transaction.init(uuid: "3", icon: "🛒", amount: "48,93", category: "Supermarket", type: "expense"),
            Transaction.init(uuid: "4", icon: "🎮", amount: "50,00", category: "Game", type: "expense"),
            Transaction.init(uuid: "5", icon: "🍽️", amount: "127,40", category: "Restaurant", type: "expense"),
            Transaction.init(uuid: "6", icon: "💸", amount: "2000,00", category: "Innova SPA", type: "income")
        ]
    ),
    .init(
        uuid: "213-3oi3",
        separator: Separator.init(title: "03 April"),
        transactionsCollection: [
            Transaction.init(uuid: "6", icon: "🛍️", amount: "99,99", category: "Shopping", type: "expense"),
            Transaction.init(uuid: "7", icon: "🚕", amount: "25,00", category: "Transportation", type: "expense"),
            Transaction.init(uuid: "8", icon: "🏥", amount: "350,00", category: "Medical", type: "expense"),
            Transaction.init(uuid: "9", icon: "🏠", amount: "1200,00", category: "Housing", type: "expense"),
            Transaction.init(uuid: "10", icon: "💻", amount: "899,00", category: "Technology", type: "expense"),
            Transaction.init(uuid: "11", icon: "📚", amount: "30,00", category: "Education", type: "expense"),
            Transaction.init(uuid: "12", icon: "🎁", amount: "50,00", category: "Gifts", type: "expense")
        ]
    )
]
