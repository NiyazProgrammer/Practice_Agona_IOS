import Foundation

class CombinedTransactionRepository: TransactionRepository {
    private let localRepository: TransactionRepository
    private let remoteRepository: TransactionRepository

    init(localRepository: TransactionRepository, remoteRepository: TransactionRepository) {
        self.localRepository = localRepository
        self.remoteRepository = remoteRepository
    }

    func addTransaction(_ transaction: Transaction) {
        localRepository.addTransaction(transaction)
        remoteRepository.addTransaction(transaction)
    }

    func deleteTransaction(_ transaction: Transaction) {
        localRepository.deleteTransaction(transaction)
        remoteRepository.deleteTransaction(transaction)
    }

    func fetchTransactions(completion: @escaping ([Transaction]) -> Void) {
        // Запрос транзакции
    }
}
