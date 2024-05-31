import Foundation
import SwiftUI

struct BankCard: Identifiable, Codable {
    var id: UUID
    var backImage: String
    let name: String
    let totalMoney: Double
    let labelImage: String
    var transactions: [Transaction]?

    init(from card: BankCardData) {
        self.id = card.id
        self.backImage = card.backImage
        self.name = card.name
        self.totalMoney = card.totalMoney
        self.labelImage = card.icon
        self.transactions = card.transactions?.map {return Transaction(from: $0)}
    }
}
