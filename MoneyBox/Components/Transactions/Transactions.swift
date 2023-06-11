//
//  Transactions.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 18/04/23.
//

import SwiftUI

let store = TransactionStore()
var trans: [Group] = store.getTransactionComponents()

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
                    ForEach(trans) { transactionDay in
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
                        shouldPresentIncomeSheet.toggle()
                    }
                    .font(.system(size: 16, weight: .semibold))
                    .padding(18)
                    .padding([.leading, .trailing])
                    .background(Color("income"))
                    .foregroundColor(.white)
                    .cornerRadius(18)
                    .sheet(isPresented: $shouldPresentIncomeSheet) {
                        print("Sheet dismissed!")
                    } content: {
                        AddIncomeView()
                            .presentationDetents([.fraction(0.42)])
                    }
                    
                    
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
                    .sheet(isPresented: $shouldPresentExpenseSheet) {
                        print("Sheet dismissed!")
                    } content: {
                        AddExpenseView()
                            .presentationDetents([.fraction(0.42)])
                    }
                }
            }
                .padding([.leading, .trailing])
                .opacity(toggleButtons ? 0.0 : 1.0)
                .animation(.easeInOut(duration: 0.2), value: toggleButtons)
        }
    }
}

struct AddIncomeView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var icon = "🛒"
    @State private var amount = ""
    @State private var title = ""
    @State private var date = Date()

    var body: some View {
        VStack (spacing: 14) {
            HStack {
                ZStack(alignment: .center) {
                    Rectangle()
                        .frame(width: 56, height: 56)
                        .cornerRadius(15)
                        .foregroundColor(Color("transactionBox"))
                    Text("🛒")
                        .font(.system(size: 26))
                }
                
                Spacer(minLength: 20)
                
                DatePicker("", selection: $date)
                    .textInputAutocapitalization(.sentences)
                    .disableAutocorrection(true)
                    .labelsHidden()
            }
            
            TextField("Title", text: $title)
                .padding(12)
                .background(Color("transactionBox"))
                .cornerRadius(10)
                .textInputAutocapitalization(.sentences)
                .disableAutocorrection(true)
            
            TextField("Amount", text: $amount)
                .padding(12)
                .background(Color("transactionBox"))
                .cornerRadius(10)
                .textInputAutocapitalization(.sentences)
                .disableAutocorrection(true)
            
            Spacer()
            
            Button("Add") {
                let transaction = TransactionStd(type: "income", icon: icon, amount: amount, category: title, date: date)
                store.appendTransaction(transaction: transaction)
                trans = store.getTransactionComponents()
                
                dismiss()
            }
            .frame(maxWidth: .infinity)
                .font(.system(size: 16, weight: .semibold))
                .padding(18)
                .padding([.leading, .trailing])
                .background(Color("income"))
                .foregroundColor(.white)
                .cornerRadius(18)
        }
        .padding([.leading, .top, .trailing])
    }
}

struct AddExpenseView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var icon = "🛒"
    @State private var amount = ""
    @State private var title = ""
    @State private var date = Date()

    var body: some View {
        VStack (spacing: 14) {
            HStack {
                ZStack(alignment: .center) {
                    Rectangle()
                        .frame(width: 56, height: 56)
                        .cornerRadius(15)
                        .foregroundColor(Color("transactionBox"))
                    Text(icon)
                        .font(.system(size: 26))
                }
                
                Spacer(minLength: 20)
                
                DatePicker("", selection: $date)
                    .textInputAutocapitalization(.sentences)
                    .disableAutocorrection(true)
                    .labelsHidden()
            }
            
            TextField("Title", text: $title)
                .padding(12)
                .background(Color("transactionBox"))
                .cornerRadius(10)
                .textInputAutocapitalization(.sentences)
                .disableAutocorrection(true)
            
            TextField("Amount", text: $amount)
                .padding(12)
                .background(Color("transactionBox"))
                .cornerRadius(10)
                .textInputAutocapitalization(.sentences)
                .disableAutocorrection(true)
            
            Spacer()
            
            Button("Add") {
                let transaction = TransactionStd(type: "expense", icon: icon, amount: amount, category: title, date: date)
                store.appendTransaction(transaction: transaction)
                trans = store.getTransactionComponents()
                
                dismiss()
            }
            .frame(maxWidth: .infinity)
                .font(.system(size: 16, weight: .semibold))
                .padding(18)
                .padding([.leading, .trailing])
                .background(Color("expense"))
                .foregroundColor(.white)
                .cornerRadius(18)
        }
        .padding([.leading, .top, .trailing])
    }
}
