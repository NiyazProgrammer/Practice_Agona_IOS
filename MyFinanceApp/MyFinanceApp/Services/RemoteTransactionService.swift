import Foundation
import Firebase

class RemoteTransactionService: TransactionRepository {
    func fetchTransactionsByCardId(for cardId: UUID, completion: @escaping ([Transaction]) -> Void) {

    }
    
    func addTransactionByCard(for card: BankCard, _ transaction: Transaction) {
        let db = Firestore.firestore()
        let transactionData: [String: Any] = [
            "id": transaction.id.uuidString,
            "name": transaction.name,
            "date": transaction.date,
            "price": transaction.price,
            "type": transaction.type.rawValue,
            "transactionCategory": transaction.category.rawValue
        ]

        db.collection("cards").document(card.id.uuidString).collection("transactions").document(transaction.id.uuidString).setData(transactionData) { error in
            if let error = error {
                print("Error adding transaction: \(error)")
            } else {
                print("Transaction added successfully")
            }
        }
    }

    func deleteTransaction(for card: BankCard, _ transaction: Transaction) {

    }

    func fetchTransactions(for card: BankCard, completion: @escaping ([Transaction]) -> Void) {

    }

    func fetchTransactionsByCardId(for cardId: UUID, completion: @escaping (Transaction) -> Void) {
        
    }

}
