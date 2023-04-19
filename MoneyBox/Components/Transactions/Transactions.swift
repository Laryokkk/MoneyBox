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
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                ForEach(transactionCollection) { transactionDay in
                    transactionDay
                }
            }
        }.padding([.leading, .trailing])
    }
}

private let transactionCollection: [Group] = [
    .init(
        separator: Separator.init(title: "Today"),
        transactionsCollection: [
            Transaction.init(icon: "🥃", amount: "18,50", category: "Bar", type: "expense"),
            Transaction.init(icon: "✈️", amount: "250,00", category: "Travel", type: "expense")
        ]
    ),
    .init(
        separator: Separator.init(title: "04 April"),
        transactionsCollection: [
            Transaction.init(icon: "🛒", amount: "48,93", category: "Supermarket", type: "expense"),
            Transaction.init(icon: "🎮", amount: "50,00", category: "Game", type: "expense"),
            Transaction.init(icon: "🍽️", amount: "127,40", category: "Restaurant", type: "expense"),
            Transaction.init(icon: "💸", amount: "2000,00", category: "Innova SPA", type: "income")
        ]
    ),
    .init(
        separator: Separator.init(title: "03 April"),
        transactionsCollection: [
            Transaction.init(icon: "🛍️", amount: "99,99", category: "Shopping", type: "expense"),
            Transaction.init(icon: "🚕", amount: "25,00", category: "Transportation", type: "expense"),
            Transaction.init(icon: "🏥", amount: "350,00", category: "Medical", type: "expense"),
            Transaction.init(icon: "🏠", amount: "1200,00", category: "Housing", type: "expense"),
            Transaction.init(icon: "💻", amount: "899,00", category: "Technology", type: "expense"),
            Transaction.init(icon: "📚", amount: "30,00", category: "Education", type: "expense"),
            Transaction.init(icon: "🎁", amount: "50,00", category: "Gifts", type: "expense")
        ]
    )
]
