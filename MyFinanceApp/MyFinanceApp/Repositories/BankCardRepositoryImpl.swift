import Foundation
import CoreData

class BankCardRepositoryImpl: NSObject, BankCardRepositoryProtocol {
    var onChange: (() -> Void)?
    private let localService: LocalBankCardService
    private let remoteService: RemoteBankCardService

    init(localService: LocalBankCardService, remoteService: RemoteBankCardService) {
        self.localService = localService
        self.remoteService = remoteService

        super.init()

        localService.fetchedResultsController.delegate = self
    }

    func fetchBankCards(handler: @escaping ((Result<[BankCard], any Error>) -> Void)) {
        localService.fetchBankCards { result in
            switch result {
            case .success(let bankCards):
                handler(.success(bankCards))
            case .failure(let error):
                handler(.failure(error))
            }
        }

        // MARK: Тут нужно добавить синхронизацию с базой данных
        syncWithRemote()
    }

    private func syncWithRemote() {
        remoteService.fetchBankCards { [weak self] result in
            switch result {
            case .success(let remoteBankCards):
                self?.updateLocalCache(with: remoteBankCards)
            case .failure(let error):
                print("Error fetching remote bank cards: \(error)")
            }
        }
    }

    private func updateLocalCache(with remoteBankCards: [BankCard]) {
        let context = CoreDataManager.shared.viewContext
        context.perform {
            for remoteCard in remoteBankCards {
                if let localCard = self.localService.fetchedResultsController.fetchedObjects?.first(where: { $0.id == remoteCard.id }) {
                    // Update existing local card
                    localCard.name = remoteCard.name
                    localCard.backImage = remoteCard.backImage
                    localCard.totalMoney = remoteCard.totalMoney
                    localCard.icon = remoteCard.labelImage
                } else {
                    // Add new remote card to local store
                    context.createBankCard(from: remoteCard)
                }
            }
            CoreDataManager.shared.saveContext()
        }
    }

    func addBankCard(_ card: BankCard) {
        localService.addBankCard(card)
        remoteService.addBankCard(card)
    }

    func deleteBankCard(_ card: BankCard, completion: @escaping ((Result<Bool, any Error>) -> Void)) {
        // MARK: Реализация удаления в базу данных
        localService.deleteBankCard(card) { localResult in
                    switch localResult {
                    case .success:
                        self.remoteService.deleteBankCard(card) { remoteResult in
                            completion(remoteResult)
                        }
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
    }

    func updateBankCard(_ bankCard: BankCard, completion: @escaping ((Result<Bool, any Error>) -> Void)) {
        // MARK: Реализация обновления в базу данных
        localService.updateBankCard(bankCard) { localResult in
                   switch localResult {
                   case .success:
                       self.remoteService.updateBankCard(bankCard) { remoteResult in
                           completion(remoteResult)
                       }
                   case .failure(let error):
                       completion(.failure(error))
                   }
               }
    }

}
extension BankCardRepositoryImpl: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        onChange?()
    }
}
