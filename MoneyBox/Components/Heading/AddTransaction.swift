//
//  AddTransaction.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 19/04/23.
//

import SwiftUI

public struct AddTransaction: View {
    
    public var body: some View {
        VStack {
            inputData.init()
        }
    }
}

private struct inputData: View {
    @State private var spend: String = ""
    @State private var name: String = ""
    @State private var section: String = ""
    @State private var date: Date = Date()
    
    var body: some View {
        VStack (spacing: 15) {
            HStack (spacing: 15) {
                Button(action: {}){
                    ZStack {
                        Rectangle()
                        .cornerRadius(15)
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color("transactionBox"))
                        
                        Image("iconPlus")
                    }
                }
                
                TextField(
                    "Amount",
                    text: $spend
                )
                .padding(10)
                .background(Color("transactionBox"))
                .cornerRadius(5)
                
            }
            
            TextField(
                "Name",
                text: $name
            )
            .padding(10)
            .background(Color("transactionBox"))
            .cornerRadius(5)
            
            TextField(
                "Section",
                text: $section
            )
            .padding(10)
            .background(Color("transactionBox"))
            .cornerRadius(5)
            
            button.init()
        }
        .padding()
        .background(Color("backgroundExtend"))
        .cornerRadius(15)
    }
}

private struct button: View {
    var body: some View {
        Button(action: {}) {
            Text("Add Expense")
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(Color("transactionBox"))
        .cornerRadius(15)
        .padding([.top], 20)
    }
}
