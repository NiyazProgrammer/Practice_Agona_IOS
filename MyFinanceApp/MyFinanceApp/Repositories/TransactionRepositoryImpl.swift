import Foundation

class TransactionRepositoryImpl: TransactionRepository {
    func fetchTransactionsByCardId(for cardId: UUID, completion: @escaping ([Transaction]) -> Void) {
        
    }
    
    private let localService: TransactionRepository
    private let remoteService: TransactionRepository

    init(localService: TransactionRepository, remoteService: TransactionRepository) {
        self.localService = localService
        self.remoteService = remoteService
    }

    func addTransactionByCard(for card: BankCard, _ transaction: Transaction) {
        localService.addTransactionByCard(for: card, transaction)
        remoteService.addTransactionByCard(for: card, transaction)
    }

    func deleteTransaction(for card: BankCard, _ transaction: Transaction) {

    }

    func fetchTransactions(for card: BankCard, completion: @escaping ([Transaction]) -> Void) {

    }

    func fetchTransactionsByCardId(for cardId: UUID, completion: @escaping (Transaction) -> Void) {

    }
}
