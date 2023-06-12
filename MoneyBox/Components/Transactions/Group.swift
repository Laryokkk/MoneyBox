//
//  Group.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 18/04/23.
//

import SwiftUI

public struct Group: View, Identifiable {
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
