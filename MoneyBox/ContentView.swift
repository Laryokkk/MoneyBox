//
//  ContentView.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 11/04/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var body: some View {
        VStack {
            Heading.init()
            Transactions.init()
        }
        .background(Color("background"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
