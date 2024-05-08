import Foundation
import SwiftUI

struct Transaction {
    let categoryImage: String
    let categoryName: String
    let date: String
    let price: Double
    var type: TransitionType.RawValue

    var dateParsed: Date {
        date.dateParse()
    }

    var signedAmount: Double {
        return type == TransitionType.income.rawValue ? price : -price
    }

    var month: String {
        dateParsed.formatted(.dateTime.year().month(.wide ))
    }
}

enum TransitionType: String {
    case expense = "expense"
    case income = "income"
}
