//
//  Heading.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 18/04/23.
//

import SwiftUI

public struct Heading: View {
    let balance: String = "1000"
    let income: String = "2000"
    let expense: String = "1000"
    
    public var body: some View {
        VStack {
            Balance.init(balance: balance, income: income, expense: expense)
        }.padding([.leading, .trailing])
    }
}
