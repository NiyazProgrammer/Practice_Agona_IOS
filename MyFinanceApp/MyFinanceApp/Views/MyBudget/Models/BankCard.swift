import Foundation
import SwiftUI

struct BankCard: Identifiable {
    var id = UUID().uuidString
    var backImage: Image
    let name: String
    let totalMoney: Double
    let labelImage: Image
    var transactions: [Transaction]?
}
