//
//  ViewAmount.swift
//  MoneyBox
//
//  Todo:
//    - Add icon picker
//

import SwiftUI
import Foundation

public struct ViewAmount: View {
    let type: String // income or expense
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var icon = "🛒"
    @State private var amount = ""
    @State private var title = ""
    @State private var date = Date()
    
    public var body: some View {
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
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .full
                
                let transaction = TransactionStd(
                    type: type.lowercased(),
                    icon: icon,
                    amount: amount,
                    category: title,
                    date: dateFormatter.string(from: date)
                )
                
                store.appendTransaction(transaction: transaction)
                
                dismiss()
            }
            .frame(maxWidth: .infinity)
            .font(.system(size: 16, weight: .semibold))
            .padding(18)
            .padding([.leading, .trailing])
            .background(Color(type.lowercased()))
            .foregroundColor(.white)
            .cornerRadius(18)
        }
        .padding([.leading, .top, .trailing])
    }
}
