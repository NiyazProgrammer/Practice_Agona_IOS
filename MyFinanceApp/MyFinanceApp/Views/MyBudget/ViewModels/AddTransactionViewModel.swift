import Foundation

class AddTransactionViewModel: ObservableObject {
    @Published var selectedTransactionType: TransactionType = .expense
    @Published var amount: String = ""
    @Published var description: String = ""
    @Published var selectedTypeCategory: TransactionCategory?
    @Published var showTypePicker: Bool = false
    @Published var selectedDate: Date = Date()
    @Published var showDatePicker: Bool = false

    private let repository: TransactionRepository

    init(repository: TransactionRepository) {
        self.repository = repository
    }

    var categories: [TransactionCategory] {
        switch selectedTransactionType {
        case .expense:
            return TransactionExpenseCategory.allCases.map {
                TransactionCategory.expense($0)
            }
        case .income:
            return TransactionIncomeCategory.allCases.map {
                TransactionCategory.income($0)
            }
        }
    }

    func updateSelectedCategory(_ category: String) {
        switch selectedTransactionType {
        case .expense:
            guard let category = TransactionExpenseCategory(rawValue: category) else { return }
            selectedTypeCategory = .expense(category)
        case .income:
            guard let category = TransactionIncomeCategory(rawValue: category) else { return }
            selectedTypeCategory = .income(category)
        }
    }

    func addTransaction() {
        guard isFormValid() else { return }

        guard let selectedTypeCategory = selectedTypeCategory, let amount = Double(amount)
        else {
            return
        }

//        let transaction = Transaction(
//            id: UUID(),
//            name: selectedTransactionType.rawValue,
//            date: DateFormatter.dateFormatter.string(from: selectedDate),
//            price: Double(amount),
//            type: selectedTransactionType,
//            transactionCategory: selectedTypeCategory,
//            descriptions: [TransactionDescriptionsModel(name: description, price: Double(amount))]
//        )
//        repository.addTransaction(transaction)
    }

    func isFormValid() -> Bool {
        return !amount.isEmpty && selectedTypeCategory != nil
    }
}
