import Foundation
import CoreData

enum DataBaseError: Error {
    case fetchByCoreDataError
    case canNotDeleteBankCardError
    case canNotUpdateBankCardError
}
class LocalBankCardService: NSObject, BankCardServiceProtocol {
    let fetchedResultsController: NSFetchedResultsController<BankCardData>
    var onChange: (() -> Void)?

    override init() {
        let fetchRequest: NSFetchRequest<BankCardData> = BankCardData.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]

        fetchedResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: CoreDataManager.shared.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )

        super.init()

        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("Failed to fetch bank cards: \(error)")
        }
    }

    func fetchBankCards(handler: @escaping ((Result<[BankCard], any Error>) -> Void)) {
        if let bankCardsData = fetchedResultsController.fetchedObjects {
            var result = bankCardsData.map {
                return BankCard(from: $0)
            }
            handler(.success(result))
        } else {
            handler(.failure(DataBaseError.fetchByCoreDataError))
        }
    }

    func addBankCard(_ card: BankCard) {
        CoreDataManager.shared.viewContext.createBankCard(from: card)
        CoreDataManager.shared.saveContext()
    }


    func updateBankCard(_ bankCard: BankCard, completion: @escaping ((Result<Bool, Error>) -> Void)) {
        if let currentCard = fetchedResultsController.fetchedObjects?.first(where: { $0.id == bankCard.id}) {
            currentCard.name = bankCard.name
            currentCard.backImage = bankCard.backImage
            currentCard.totalMoney = bankCard.totalMoney
            currentCard.icon = bankCard.labelImage

            CoreDataManager.shared.saveContext()
            completion(.success(true))
        } else {
            completion(.failure(DataBaseError.canNotUpdateBankCardError))
        }

    }

    func deleteBankCard(_ card: BankCard, completion: @escaping ((Result<Bool, Error>) -> Void)) {
        if let currentCard = fetchedResultsController.fetchedObjects?.first(where: { $0.id == card.id}) {
            CoreDataManager.shared.viewContext.delete(currentCard)
            CoreDataManager.shared.saveContext()
            completion(.success(true))
        } else {
            completion(.failure(DataBaseError.canNotDeleteBankCardError))
        }
    }
//    func fetchBudgetData() -> [BankCard] {
//        //        var card = BankCard(id: UUID(), backImage: "background1",
//        //                              name: "Tinkoff",
//        //                              totalMoney: 10000,
//        //                              labelImage: "creditcard",
//        //                              transactions: [
//        //                                Transaction(id: UUID(),
//        //                                            name: "Shirt",
//        //                                            date: "01/05/2024",
//        //                                            price: 500,
//        //                                            type: .expense, transactionCategory: .expense(.clothing),
//        //                                            descriptions: [
//        //                                                TransactionDescriptionsModel(name: "Shirt",
//        //                                                                             price: 500)
//        //                                            ]),
//        //                                Transaction(id: UUID(),
//        //                                            name: "Транспорт",
//        //                                            date: "08/05/2024",
//        //                                            price: 200,
//        //                                            type: .expense, transactionCategory: .expense(.travel),
//        //                                            descriptions: [
//        //                                                TransactionDescriptionsModel(name: "Транспорт",
//        //                                                                             price: 100),
//        //                                                TransactionDescriptionsModel(name: "Транспорт",
//        //                                                                             price: 100)
//        //                                            ]),
//        //                                Transaction(id: UUID(),
//        //                                            name: "Транспорт",
//        //                                            date: "02/04/2024",
//        //                                            price: 100,
//        //                                            type: .expense, transactionCategory: .expense(.travel),
//        //                                            descriptions: [
//        //                                                TransactionDescriptionsModel(name: "Транспорт",
//        //                                                                             price: 50),
//        //                                                TransactionDescriptionsModel(name: "Транспорт",
//        //                                                                             price: 50)
//        //                                            ]),
//        //                                Transaction(id: UUID(),
//        //                                            name: "Транспорт",
//        //                                            date: "08/03/2024",
//        //                                            price: 200,
//        //                                            type: .expense, transactionCategory: .expense(.travel),
//        //                                            descriptions: [
//        //                                                TransactionDescriptionsModel(name: "Транспорт",
//        //                                                                             price: 100),
//        //                                                TransactionDescriptionsModel(name: "Транспорт",
//        //                                                                             price: 100)
//        //                                            ]),
//        //                                Transaction(id: UUID(),
//        //                                            name: "Бизнес",
//        //                                            date: "01/05/2024",
//        //                                            price: 1000,
//        //                                            type: .income, transactionCategory: .income(.business),
//        //                                            descriptions: [
//        //                                                TransactionDescriptionsModel(name: "Бизнес",
//        //                                                                             price: 250)
//        //                                            ]),
//        //                                Transaction(id: UUID(),
//        //                                            name: "Бизнес",
//        //                                            date: "01/03/2024",
//        //                                            price: 1000,
//        //                                            type: .income, transactionCategory: .income(.salary),
//        //                                            descriptions: [
//        //                                                TransactionDescriptionsModel(name: "Зарплата",
//        //                                                                             price: 250)
//        //                                            ])
//        //                              ])
//        //        var card2 = BankCard(id: UUID(), backImage: "background9",
//        //                              name: "Sber",
//        //                              totalMoney: 50000,
//        //                              labelImage: "creditcard",
//        //                              transactions: [
//        //                                Transaction(id: UUID(),
//        //                                            name: "Зарплата",
//        //                                            date: "01/05/2024",
//        //                                            price: 100000000000,
//        //                                            type: .income,
//        //                                            transactionCategory: .income(.salary),
//        //                                            descriptions: [
//        //                                                TransactionDescriptionsModel(name: "Зарплата",
//        //                                                                             price: 50000),
//        //                                                TransactionDescriptionsModel(name: "Акции",
//        //                                                                             price: 50000)
//        //                                            ]),
//        //                                Transaction(id: UUID(),
//        //                                            name: "Транспорт",
//        //                                            date: "01/05/2024",
//        //                                            price: 50000000000,
//        //                                            type: .expense, transactionCategory: .expense(.transport),
//        //                                            descriptions: [
//        //                                                TransactionDescriptionsModel(name: "Транспорт",
//        //                                                                             price: 50),
//        //                                                TransactionDescriptionsModel(name: "Транспорт",
//        //                                                                             price: 50)
//        //                                            ]),
//        //                                Transaction(id: UUID(),
//        //                                            name: "Подписки Яндекс",
//        //                                            date: "01/05/2024",
//        //                                            price: 399,
//        //                                            type: .expense, transactionCategory: .expense(.subscriptions),
//        //                                            descriptions: [
//        //                                                TransactionDescriptionsModel(name: "Подписки Яндекс",
//        //                                                                             price: 399)
//        //                                            ]),
//        //                                Transaction(id: UUID(),
//        //                                            name: "Еда",
//        //                                            date: "01/05/2024",
//        //                                            price: 1000,
//        //                                            type: .expense, transactionCategory: .expense(.food),
//        //                                            descriptions: [
//        //                                                TransactionDescriptionsModel(name: "Шашлык",
//        //                                                                             price: 250),
//        //                                                TransactionDescriptionsModel(name: "Коктель",
//        //                                                                             price: 50000)
//        //                                            ]),
//        //                                Transaction(id: UUID(),
//        //                                            name: "Бизнес",
//        //                                            date: "01/05/2024",
//        //                                            price: 1000,
//        //                                            type: .income, transactionCategory: .income(.business),
//        //                                            descriptions: [
//        //                                                TransactionDescriptionsModel(name: "Бизнес",
//        //                                                                             price: 250)
//        //                                            ])
//        //                              ])
//        //        if(bankCards.isEmpty) {
//        //            bankCards.append(card)
//        //            bankCards.append(card2)
//        //        }
//        //
//        //        let totalMoney = bankCards.reduce(0.0) {$0 + $1.totalMoney}
//        //        return bankCards
//        return []
//    }

//    func accumulateTransactions() {
//        //        guard !transactions.isEmpty else { return }
//        //
//        //        let today = "01/05/2024".dateParse()
//        //        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)
//    }
}


