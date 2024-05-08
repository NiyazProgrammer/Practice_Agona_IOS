import Foundation

enum KeychainError: Error {
    case dublicateItem
    case unknown(status: OSStatus)
}

// MARK: Скорее всего откожуст от встроенного KeyChain и буду использовать библиотеку
final class KeyChainManager {
    static func save(password: Data, account: String) throws -> String {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword, // для хранения пароля
            kSecAttrAccount: account,
            kSecValueData: password
        ]

        // Для сохр в keychain
        let status = SecItemAdd(query as CFDictionary, nil)

        // обработка статуса
        guard status != errSecDuplicateItem else {
            throw KeychainError.dublicateItem
        }

        guard status == errSecSuccess else {
            throw KeychainError.unknown(status: status)
        }

        return "Saved"
    }

    static func getPAssword(for account: String) throws -> Data? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword, // для хранения пароля
            kSecAttrAccount: account,
            kSecReturnData: kCFBooleanTrue as Any // Указывает что типы возвр значений должны быть  Data
        ]

        var result: AnyObject?

        // Извлечение объекта из keychain
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard status == errSecSuccess else {
            throw KeychainError.unknown(status: status)
        }

        return result as? Data
    }
}
