//
//  Separatior.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 18/04/23.
//

import SwiftUI

public struct Separator: View {
    let title: String
    
    public var body: some View {
        HStack {
            Text(title)
                .font(.system(
                    size: 18,
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
