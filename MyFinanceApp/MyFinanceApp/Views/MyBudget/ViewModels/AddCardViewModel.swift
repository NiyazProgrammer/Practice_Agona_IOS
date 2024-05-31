import Foundation

class AddCardViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var selectedCurrency: String = "Российский рубль"
    @Published var selectedIcon: String = "defaultIcon"
    @Published var selectedBackground: String = "defaultBackground"
    @Published var selectedBalance: String = "0,00"

//    private let repository: BankCardRepository

//    init(repository: BankCardRepository) {
//        self.repository = repository
//    }

    func saveCard() {
//        repository.addBankCard(BankCard(backImage: selectedBackground,
//                                        name: name,
//                                        totalMoney: Double(selectedBalance) ?? 0.0,
//                                        labelImage: selectedIcon)) { data in
//
//        }
//        MyBudgetApiManager.shared.addBankCard(card: BankCard(id: UUID(), backImage: selectedBackground,
//                                                             name: name,
//                                                             totalMoney: Double(selectedBalance) ?? 0.0,
//                                                             labelImage: selectedIcon))
    }
}
