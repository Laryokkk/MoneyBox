//
//  Transactions.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 18/04/23.
//

import SwiftUI

let store = TransactionStore()

struct Transactions: View {
    @State private var toggleButtons = false
    @State var shouldPresentIncomeSheet = false
    @State var shouldPresentExpenseSheet = false
    
    @AppStorage("balance", store: .standard) var balance = 0
    @AppStorage("income", store: .standard) var income = 0
    @AppStorage("expense", store: .standard) var expense = 0
    
    @AppStorage("RawTransactions") var transactions: [[String]] = []
    
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    ForEach(store.getTransactionComponents()) { transactionDay in
                        transactionDay
                    }
                }
            }
                .padding([.leading, .trailing])
                .simultaneousGesture( DragGesture().onChanged ({
                        toggleButtons = !($0.translation.height > 0)
                    })
                )
            
            
            VStack {
                Spacer()
                
                HStack() {
                    Button("Income") {
                        income += 100
                        balance = (income - expense)
                        shouldPresentIncomeSheet.toggle()
                    }
                    .font(.system(size: 16, weight: .semibold))
                    .padding(18)
                    .padding([.leading, .trailing])
                    .background(Color("income"))
                    .foregroundColor(.white)
                    .cornerRadius(18)
                    .sheet(isPresented: $shouldPresentIncomeSheet) { }
                        content: {ViewAmount(type: "income").presentationDetents([.fraction(0.42)])}
                    
                    
                    Spacer()
                    
                    Button("Expense") {
                        expense += 100
                        balance = (income - expense)
                        shouldPresentExpenseSheet.toggle()
                    }
                    .font(.system(size: 16, weight: .semibold))
                    .padding(18)
                    .padding([.leading, .trailing])
                    .background(Color("expense"))
                    .foregroundColor(.white)
                    .cornerRadius(18)
                    .sheet(isPresented: $shouldPresentExpenseSheet) { }
                        content: {ViewAmount(type: "expense").presentationDetents([.fraction(0.42)])}
                }
            }
            .padding([.leading, .trailing])
            .opacity(toggleButtons ? 0.0 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: toggleButtons)
        }
    }
}

struct Separator: View {
    let title: String
    
    public var body: some View {
        HStack {
            Text(title)
                .font(.system(
                    size: 14,
                    weight: .regular
                ))
                .foregroundColor(Color("textExtend"))
            Spacer()
            Rectangle()
                .padding([.leading], 10)
                .frame(height: 2)
                .foregroundColor(Color("text"))
        }
        .padding([.top, .bottom], 10)
        .background(Color("background"))
    }
}

struct Transaction: View, Identifiable {
    public let id = UUID()
    
    let icon: String
    let amount: String
    let category: String
    let type: String
    
    public var body: some View {
        HStack {
            ZStack(alignment: .center) {
                Rectangle()
                    .frame(width: 48, height: 48)
                    .cornerRadius(15)
                    .foregroundColor(Color("transactionBox"))
                Text(icon)
                    .font(.system(size: 26))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(category)
                    .foregroundColor(Color("textExtend"))
                //                HStack {
                //                    ZStack{
                //                        Circle().frame(width: 14)
                //                        Circle().frame(width: 6).foregroundColor(Color("background"))
                //                    }
                //                    ZStack{
                //                        Circle().frame(width: 14)
                //                        Circle().frame(width: 6).foregroundColor(Color("background"))
                //                    }
                //                }
            }
            Spacer()
            Text("\(amount)$")
                .foregroundColor(Color("text"))
                .font(.system(size: 18,weight: .bold))
            Image(type)
        }
    }
}

struct Group: View, Identifiable {
    public let id = UUID()
    
    let separator: Separator
    let transactionsCollection: [Transaction]
    
    public var body: some View {
        Section (header: separator) {
            ForEach(transactionsCollection) { transaction in
                transaction
            }
        }
    }
}

let transactionCollection: [Group] = [
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
