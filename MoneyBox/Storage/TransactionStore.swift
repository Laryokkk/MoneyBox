import SwiftUI
import Foundation

class TransactionStore {
    
    @AppStorage("RawTransactions") var transactions: [[String]] = []
    
    let transactionCollection: [Group] = [
        .init(
            separator: Separator(title: "Today"),
            transactionsCollection: [
                Transaction(icon: "🥃", amount: "18,50", category: "Bar", type: "expense"),
                Transaction(icon: "✈️", amount: "250,00", category: "Travel", type: "expense")
            ]
        ),
        .init(
            separator: Separator(title: "04 April"),
            transactionsCollection: [
                Transaction(icon: "🛒", amount: "48,93", category: "Supermarket", type: "expense"),
                Transaction(icon: "🎮", amount: "50,00", category: "Game", type: "expense"),
                Transaction(icon: "🍽️", amount: "127,40", category: "Restaurant", type: "expense"),
                Transaction(icon: "💸", amount: "2000,00", category: "Innova SPA", type: "income")
            ]
        ),
        .init(
            separator: Separator(title: "03 April"),
            transactionsCollection: [
                Transaction(icon: "🛍️", amount: "99,99", category: "Shopping", type: "expense"),
                Transaction(icon: "🚕", amount: "25,00", category: "Transportation", type: "expense"),
                Transaction(icon: "🏥", amount: "350,00", category: "Medical", type: "expense"),
                Transaction(icon: "🏠", amount: "1200,00", category: "Housing", type: "expense"),
                Transaction(icon: "💻", amount: "899,00", category: "Technology", type: "expense"),
                Transaction(icon: "📚", amount: "30,00", category: "Education", type: "expense"),
                Transaction(icon: "🎁", amount: "50,00", category: "Gifts", type: "expense")
            ]
        )
    ]
    
    func appendTransaction(transaction: TransactionStd) {
        self.transactions.append(transaction.getRawTransaction())
    }
    
//    func getTransactionsRaw() {
//
//    }
    
    func getTransactionComponents() -> [Group] {
        var data: [Group] = []
        
        for transaction in self.transactions {
            data.append(
                Group.init(
                    separator: Separator(title: transaction[4]),
                    transactionsCollection: [
                        Transaction(icon: transaction[1], amount: transaction[2], category: transaction[3], type: transaction[0])
                    ]
                )
            )
        }
        
        return data
    }
}

class TransactionStd {
    var type: String?
    var icon: String?
    var amount: String?
    var category: String?
    var date: String?
    
    init(type: String?, icon: String?, amount: String?, category: String?, date: Date?) {
        self.type = type
        self.icon = icon
        self.amount = amount
        self.category = category
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        if let date = date {
            self.date = formatter.string(from: date)
        } else {
            self.date = nil
        }
    }

    
    func getRawTransaction() -> [String] {
        return [type ?? "", icon ?? "", amount ?? "", category ?? "", date ?? ""]
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            self = []
            return
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
