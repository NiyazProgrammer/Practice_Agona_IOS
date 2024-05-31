import Foundation
import SwiftUI

class MyBudgetApiManager: ObservableObject {
    static var shared = MyBudgetApiManager()

    private init() {}

    private var bankCards: [BankCard] = []

    func addBankCard(card: BankCard) {
        bankCards.append(card)
    }

//    func fetchBudgetData(completion: @escaping ( [BankCard], Double) -> Void) {
//        var card = BankCard(id: UUID(), backImage: "background1",
//                              name: "Tinkoff",
//                              totalMoney: 10000,
//                              labelImage: "creditcard",
//                              transactions: [
//                                Transaction(id: UUID(),
//                                            name: "Shirt",
//                                            date: "01/05/2024",
//                                            price: 500,
//                                            type: .expense, transactionCategory:  .expense(.clothing),
//                                            descriptions: [
//                                                TransactionDescriptionsModel(name: "Shirt",
//                                                                             price: 500)
//                                            ]),
//                                Transaction(id: UUID(),
//                                            name: "Транспорт",
//                                            date: "08/05/2024",
//                                            price: 200,
//                                            type: .expense, transactionCategory:  .expense(.travel),
//                                            descriptions: [
//                                                TransactionDescriptionsModel(name: "Транспорт",
//                                                                             price: 100),
//                                                TransactionDescriptionsModel(name: "Транспорт",
//                                                                             price: 100)
//                                            ]),
//                                Transaction(id: UUID(),
//                                            name: "Транспорт",
//                                            date: "02/04/2024",
//                                            price: 100,
//                                            type: .expense, transactionCategory:  .expense(.travel),
//                                            descriptions: [
//                                                TransactionDescriptionsModel(name: "Транспорт",
//                                                                             price: 50),
//                                                TransactionDescriptionsModel(name: "Транспорт",
//                                                                             price: 50)
//                                            ]),
//                                Transaction(id: UUID(),
//                                            name: "Транспорт",
//                                            date: "08/03/2024",
//                                            price: 200,
//                                            type: .expense, transactionCategory: .expense(.travel),
//                                            descriptions: [
//                                                TransactionDescriptionsModel(name: "Транспорт",
//                                                                             price: 100),
//                                                TransactionDescriptionsModel(name: "Транспорт",
//                                                                             price: 100)
//                                            ]),
//                                Transaction(id: UUID(),
//                                            name: "Бизнес",
//                                            date: "01/05/2024",
//                                            price: 1000,
//                                            type: .income, transactionCategory: .income(.business),
//                                            descriptions: [
//                                                TransactionDescriptionsModel(name: "Бизнес",
//                                                                             price: 250)
//                                            ]),
//                                Transaction(id: UUID(),
//                                            name: "Бизнес",
//                                            date: "01/03/2024",
//                                            price: 1000,
//                                            type: .income, transactionCategory: .income(.business),
//                                            descriptions: [
//                                                TransactionDescriptionsModel(name: "Бизнес",
//                                                                             price: 250)
//                                            ])
//                              ])
//        var card2 = BankCard(id: UUID(), backImage: "background9",
//                              name: "Sber",
//                              totalMoney: 50000,
//                              labelImage: "creditcard",
//                              transactions: [
//                                Transaction(id: UUID(),
//                                            name: "Зарплата",
//                                            date: "01/05/2024",
//                                            price: 100000000000,
//                                            type: .income,
//                                            transactionCategory: .income(.business),
//                                            descriptions: [
//                                                TransactionDescriptionsModel(name: "Зарплата",
//                                                                             price: 50000),
//                                                TransactionDescriptionsModel(name: "Акции",
//                                                                             price: 50000)
//                                            ]),
//                                Transaction(id: UUID(),
//                                            name: "Транспорт",
//                                            date: "01/05/2024",
//                                            price: 50000000000,
//                                            type: .expense, transactionCategory: .expense(.transport),
//                                            descriptions: [
//                                                TransactionDescriptionsModel(name: "Транспорт",
//                                                                             price: 50),
//                                                TransactionDescriptionsModel(name: "Транспорт",
//                                                                             price: 50)
//                                            ]),
//                                Transaction(id: UUID(),
//                                            name: "Подписки Яндекс",
//                                            date: "01/05/2024",
//                                            price: 399,
//                                            type: .expense, transactionCategory: .expense(.subscriptions),
//                                            descriptions: [
//                                                TransactionDescriptionsModel(name: "Подписки Яндекс",
//                                                                             price: 399)
//                                            ]),
//                                Transaction(id: UUID(),
//                                            name: "Еда",
//                                            date: "01/05/2024",
//                                            price: 1000,
//                                            type: .expense, transactionCategory: .expense(.food),
//                                            descriptions: [
//                                                TransactionDescriptionsModel(name: "Шашлык",
//                                                                             price: 250),
//                                                TransactionDescriptionsModel(name: "Коктель",
//                                                                             price: 50000)
//                                            ]),
//                                Transaction(id: UUID(),
//                                            name: "Бизнес",
//                                            date: "01/05/2024",
//                                            price: 1000,
//                                            type: .income, transactionCategory: .income(.business),
//                                            descriptions: [
//                                                TransactionDescriptionsModel(name: "Бизнес",
//                                                                             price: 250)
//                                            ])
//                              ])
//        if(bankCards.isEmpty) {
//            bankCards.append(card)
//            bankCards.append(card2)
//        }
//
//        let totalMoney = bankCards.reduce(0.0) {$0 + $1.totalMoney}
//        completion(bankCards, totalMoney)
    }

//    func accumulateTransactions() {
//        //        guard !transactions.isEmpty else { return }
//        //
//        //        let today = "01/05/2024".dateParse()
//        //        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)
//    }

