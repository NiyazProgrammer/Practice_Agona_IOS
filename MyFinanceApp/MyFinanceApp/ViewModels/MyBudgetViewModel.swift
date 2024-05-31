import Foundation
import Combine

class MyBudgetViewModel: ObservableObject {
    @Published var bankCards: [BankCard] = []
    @Published var selectedBankCard: BankCard?
    @Published var totalMoney: Double = 0
    @Published var selectedCardIndex = 0

    private var repository: BankCardRepositoryProtocol

    init(repository: BankCardRepositoryProtocol) {
        self.repository = repository
        loadData()
    }

    func loadData() {
        repository.onChange = { [weak self] in
            self?.repository.fetchBankCards { result in
                switch result {
                case .success(let bankCards):
                    self?.bankCards = bankCards
                case .failure(let error):
                    print("Error fetching bank cards: \(error)")
                }
            }
        }
        repository.fetchBankCards { result in
            switch result {
            case .success(let bankCards):
                self.bankCards = bankCards
            case .failure(let error):
                print("Error fetching bank cards: \(error)")
            }
        }
        //        MyBudgetApiManager.shared.fetchBudgetData { [weak self] bankCards, totalMoney in
        //            DispatchQueue.main.async {
        //                self?.bankCards = bankCards
        //                self?.totalMoney = totalMoney
        //                self?.selectedBankCard = bankCards[self?.selectedCardIndex ?? 0]
        //            }
        //        }
    }

    func updateOperationsForSelectedCard() {
        self.selectedBankCard = bankCards[selectedCardIndex]
    }
}
