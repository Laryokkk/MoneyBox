//
//  Transaction.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 18/04/23.
//

import SwiftUI

public struct Transaction: View, Identifiable {
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
            Text("\(amount)$")
                .foregroundColor(Color("text"))
                .font(.system(size: 18,weight: .bold))
            Image(type)
        }
    }
}
