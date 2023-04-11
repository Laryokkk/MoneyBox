//
//  ContentView.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                headingComponent
                transactionsComponent
                Spacer()
            }.padding([.leading, .trailing], 24)
        }.background(Color("background"))
    }
}

var headingComponent: some View {
    // Todo: add some more sections
    
    balanceComponent
}

var balanceComponent: some View {
    HStack {
        VStack(alignment: .leading) {
            Text("172,20$").font(.system(size: 32, weight: .bold)).foregroundColor(Color("text"))
            Text("363,20$").font(.system(size: 20, weight: .regular)).foregroundColor(Color("income"))
            Text("120,00$").font(.system(size: 20, weight: .regular)).foregroundColor(Color("expense"))
        }
        Spacer()
        Ellipse()
            .frame(width: 120, height: 140)
            .foregroundColor(.black)
        
    }.padding([.bottom], 24)
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
    //    let icon: Image
    let amount: String
    let category: String
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 48, height: 48)
                .cornerRadius(15)
                .foregroundColor(Color("transactionBox"))
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
                size: 18,
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
            TransactionElement.init(uuid: "213-dsf3", amount: "24,56", category: "Gamdasdes"),
            TransactionElement.init(uuid: "213-ds23", amount: "24,56", category: "Games")
        ]
    ),
    .init(
        uuid: "213-3oif3",
        separator: TransactionSeparator.init(title: "04 April", theme: "Good"),
        transactionsCollection: [
            TransactionElement.init(uuid: "213-dsf3", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-dsf3", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-dsf3", amount: "24,56", category: "Gamsdases"),
            TransactionElement.init(uuid: "213-ds23", amount: "24,56", category: "Games")
        ]
    ),
    .init(
        uuid: "213-3oi3",
        separator: TransactionSeparator.init(title: "03 April", theme: "Good"),
        transactionsCollection: [
            TransactionElement.init(uuid: "213-dsf3", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-dsf3", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-dsf3", amount: "24,56", category: "Gadsadmes"),
            TransactionElement.init(uuid: "213-dsf3", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-dsf3", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-dsf3", amount: "24,56", category: "Games"),
            TransactionElement.init(uuid: "213-ds23", amount: "24,56", category: "Games")
        ]
    )
]
