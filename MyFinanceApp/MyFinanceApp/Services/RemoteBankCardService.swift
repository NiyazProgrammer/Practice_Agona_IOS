import Foundation

class RemoteBankCardService: BankCardServiceProtocol {

    func fetchBankCards(handler: @escaping ((Result<[BankCard], Error>) -> Void)) {
        // Fetch bank cards from remote source, e.g., Firebase
    }

    func addBankCard(_ card: BankCard) {
        // Add bank card to remote source
    }

    func deleteBankCard(_ card: BankCard, completion: @escaping ((Result<Bool, Error>) -> Void)) {
        // Delete bank card from remote source
    }

    func updateBankCard(_ bankCard: BankCard, completion: @escaping ((Result<Bool, Error>) -> Void)) {
        // Update bank card in remote source
    }
}
