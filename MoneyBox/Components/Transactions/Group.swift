//
//  Group.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 18/04/23.
//

import SwiftUI

public struct Group: View, Identifiable {
    public var id: String {
        uuid
    }
    
    let uuid: String
    let separator: Separator
    let transactionsCollection: [Transaction]
    
    public var body: some View {
        VStack {
            separator
            ForEach(transactionsCollection) { transaction in
                transaction
            }
        }
    }
}
