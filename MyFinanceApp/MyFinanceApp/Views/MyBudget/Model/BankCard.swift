import Foundation
import SwiftUI

struct BankCard: Identifiable {
    var id = UUID().uuidString
    var backImage: Image
    let name: String
    let totalMoney: Double
    let labelImage: Image
//    static let allColors: [CardModel] = [
//        CardModel(colors: [Color("lightPurple"), Color("lightGreen")]),
//        CardModel(colors: [Color("peach"), Color("lightBlue")]),
//        CardModel(colors: [Color("pink"), Color("lightBlue")]),
//        CardModel(colors: [Color("lightGreen"), Color("lightBlue")])
//    ]
}
