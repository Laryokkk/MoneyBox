//
//  StoreStransactions.swift
//  MoneyBox
//
//  Created by Artur Smirnov on 10/06/23.
//

import SwiftUI

struct StoreStransactions: View {
    @State private var text = ""
    @AppStorage("STRING_KEY") var savedText = ""
    @AppStorage("NUMBER_KEY") var counter = 0

    
    var body: some View {
        VStack {
            Text("\(counter)")
                .font(.system(size: 100, weight: .bold, design: .serif))
                .foregroundColor(.red)
                .onTapGesture {
                    counter += 1
                }
            
            TextField("Type something", text: $text)
                .textFieldStyle(.roundedBorder)
                .font(.title)
                .disableAutocorrection(true)
                .onChange(of: text) { text in
                    self.savedText = text
                }
                .onAppear{
                    self.text = savedText
                    print("Loaded: \(savedText)")
                }
            
            Spacer()
        }
    }
}

struct StoreStransactions_Previews: PreviewProvider {
    static var previews: some View {
        StoreStransactions()
    }
}
