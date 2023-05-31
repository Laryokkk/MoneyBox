//
//  ContentView.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 11/04/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @State private var scrollViewContentSize: CGSize = .zero
    
    let balance: String = "1000"
    let income: String = "2000"
    let expense: String = "1000"
    
    var body: some View {
        VStack {
            Heading(scrollViewContentSize: $scrollViewContentSize)
                .onAppear {
                    enablePaging()
                }
            
            Transactions()
        }
        .background(Color("background"))
    }
    
    private func enablePaging() {
        DispatchQueue.main.async {
            UIScrollView.appearance().isPagingEnabled = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
