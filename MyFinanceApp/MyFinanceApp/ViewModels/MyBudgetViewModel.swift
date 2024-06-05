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
            self?.fetchBankCards()
        }
        fetchBankCards()
    }

    func fetchBankCards() {
        self.repository.fetchBankCards { [weak self] result in
            switch result {
            case .success(let bankCards):
                self?.bankCards = bankCards
                self?.updateOperationsForSelectedCard()
                self?.setTotalMoney()
            case .failure(let error):
                print("Error fetching bank cards: \(error)")
            }
        }
    }
    
    private func setTotalMoney() {
        totalMoney = bankCards.reduce(0.0) { $0 + $1.totalMoney }
    }

    func updateOperationsForSelectedCard() {
        if !bankCards.isEmpty {
            self.selectedBankCard = bankCards[selectedCardIndex]
        }
    }
}
