//
//  Heading.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 18/04/23.
//

import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

public struct Heading: View {
    let balance: String = "1000"
    let income: String = "2000"
    let expense: String = "1000"
    
    public var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack (spacing: 50) {
                Balance.init(balance: balance, income: income, expense: expense).frame(width: (UIScreen.screenWidth * 0.9))
                AddTransaction.init().frame(width: UIScreen.screenWidth * 0.9)
            }
            .padding([.leading, .trailing])
            .padding([.top], 30)
            .padding([.bottom], 36)
        }
    }
}
