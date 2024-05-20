import Foundation
import SwiftUI

struct Transaction: Identifiable {
    var id: UUID
    let name: String
    let date: String
    let price: Double
    let type: TransactionType
    let transactionCategory: TransactionCategory
    var descriptions: [TransactionDescriptionsModel] = []

    var dateParsed: Date {
        date.dateParse()
    }

    var signedAmount: Double {
        return type == TransactionType.income ? price : -price
    }

//    MARK: Преобразует дату в вид January 18, 2024
    var createDay: String {
        dateParsed.formatted(.dateTime.day().month(.wide))
    }

    var createMonth: String {
        dateParsed.formatted(.dateTime.month(.wide))
    }
}
