import Foundation
import SwiftUI

struct Transaction: Identifiable, Codable {
    var id: UUID
    let name: String
    let date: String
    let price: Double
    let type: TransactionType
    let transactionCategory: TransactionCategory
    var descriptions: [TransactionDescriptionsModel] = []

    init(from transactionData: TransactionData) {
        self.id = transactionData.id
        self.name = transactionData.name
        self.date = transactionData.date
        self.price = transactionData.price

        // Преобразование строкового значения в перечисление TransactionType
        if let transactionType = TransactionType(rawValue: transactionData.type) {
            self.type = transactionType
        } else {
            self.type = .expense
        }

        // Преобразование категории транзакции
        if let expenseCategory = TransactionExpenseCategory(rawValue: transactionData.transactionCategory) {
            self.transactionCategory = .expense(expenseCategory)
        } else if let incomeCategory = TransactionIncomeCategory(rawValue: transactionData.transactionCategory) {
            self.transactionCategory = .income(incomeCategory)
        } else {
            self.transactionCategory = .expense(.others)
        }

        self.descriptions = []
    }

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
