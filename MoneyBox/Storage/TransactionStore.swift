import SwiftUI
import Foundation

class TransactionStore {
    
    @AppStorage("RawTransactions") var transactions: [[String]] = []
    
    func appendTransaction(transaction: TransactionStd) {
        self.transactions.append(transaction.getRawTransaction())
    }

    func getTransactionComponents() -> [Group] {
        var transactionList: [TransactionStd] = []
        
        for transaction in self.transactions {
            transactionList.append(
                TransactionStd(
                    type: transaction[0],
                    icon: transaction[1],
                    amount: transaction[2],
                    category: transaction[3],
                    date: transaction[4]
                )
            )
        }
        
        var groupedTransactions: [String: [TransactionStd]] = [:]

        for transaction in transactionList {
            if let date = transaction.date {
                if groupedTransactions[date] != nil {
                    groupedTransactions[date]?.append(transaction)
                } else {
                    groupedTransactions[date] = [transaction]
                }
            }
        }

        let groupedArray: [[TransactionStd]] = groupedTransactions.values.map { $0 }

        var data: [Group] = []
        
        for group in groupedArray {
            data.append(Group.init(
                separator: Separator(title: group[0].date!),
                transactionsCollection: group.map { tr in
                    Transaction(icon: tr.icon ?? "", amount: tr.amount ?? "", category: tr.category ?? "", type: tr.type ?? "")
                }
            ))
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
    
    init(type: String?, icon: String?, amount: String?, category: String?, date: String?) {
        self.type = type
        self.icon = icon
        self.amount = amount
        self.category = category
        self.date = date
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
