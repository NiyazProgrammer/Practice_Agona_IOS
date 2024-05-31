//
//  TransactionRepository.swift
//  MyFinanceApp
//
//  Created by Нияз Ризванов on 28.05.2024.
//

import Foundation

protocol TransactionRepository {
    func addTransaction(_ transaction: Transaction)
    func deleteTransaction(_ transaction: Transaction)
    func fetchTransactions(completion: @escaping ([Transaction]) -> Void)
}
