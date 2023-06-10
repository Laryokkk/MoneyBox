//
//  Transactions.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 18/04/23.
//

import SwiftUI

struct Transactions: View {
    @State private var toggleButtons = false;
    
    @AppStorage("balance", store: .standard) var balance = 0
    @AppStorage("income", store: .standard) var income = 0
    @AppStorage("expense", store: .standard) var expense = 0
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    ForEach(transactionCollection) { transactionDay in
                        transactionDay
                    }
                }
            }
                .padding([.leading, .trailing])
                .simultaneousGesture(
                    DragGesture().onChanged ({
                        toggleButtons = !($0.translation.height > 0)
                    })
                )
            
            
            VStack {
                Spacer()
                
                HStack() {
                    Button("Income") {
                        income += 100
                        balance = (income - expense)
                    }
                    .font(.system(size: 16, weight: .semibold))
                    .padding(18)
                    .padding([.leading, .trailing])
                    .background(Color("income"))
                    .foregroundColor(.white)
                    .cornerRadius(18)
                    
                    Spacer()
                    
                    Button("Expense") {
                        expense += 100
                        balance = (income - expense)
                    }
                    .font(.system(size: 16, weight: .semibold))
                    .padding(18)
                    .padding([.leading, .trailing])
                    .background(Color("expense"))
                    .foregroundColor(.white)
                    .cornerRadius(18)
                }
            }
                .padding([.leading, .trailing])
                .opacity(toggleButtons ? 0.0 : 1.0)
                .animation(.easeInOut(duration: 0.2), value: toggleButtons)
        }
    }
}

private let transactionCollection: [Group] = [
    .init(
        separator: Separator(title: "Today"),
        transactionsCollection: [
            Transaction(icon: "🥃", amount: "18,50", category: "Bar", type: "expense"),
            Transaction(icon: "✈️", amount: "250,00", category: "Travel", type: "expense")
        ]
    ),
    .init(
        separator: Separator(title: "04 April"),
        transactionsCollection: [
            Transaction(icon: "🛒", amount: "48,93", category: "Supermarket", type: "expense"),
            Transaction(icon: "🎮", amount: "50,00", category: "Game", type: "expense"),
            Transaction(icon: "🍽️", amount: "127,40", category: "Restaurant", type: "expense"),
            Transaction(icon: "💸", amount: "2000,00", category: "Innova SPA", type: "income")
        ]
    ),
    .init(
        separator: Separator(title: "03 April"),
        transactionsCollection: [
            Transaction(icon: "🛍️", amount: "99,99", category: "Shopping", type: "expense"),
            Transaction(icon: "🚕", amount: "25,00", category: "Transportation", type: "expense"),
            Transaction(icon: "🏥", amount: "350,00", category: "Medical", type: "expense"),
            Transaction(icon: "🏠", amount: "1200,00", category: "Housing", type: "expense"),
            Transaction(icon: "💻", amount: "899,00", category: "Technology", type: "expense"),
            Transaction(icon: "📚", amount: "30,00", category: "Education", type: "expense"),
            Transaction(icon: "🎁", amount: "50,00", category: "Gifts", type: "expense")
        ]
    )
]
