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
