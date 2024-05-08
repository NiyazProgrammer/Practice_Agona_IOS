//
//  TestCell.swift
//  MyFinanceApp
//
//  Created by Нияз Ризванов on 25.04.2024.
//

import SwiftUI

struct DetailActivityCell: View {
    @State private var isCellExpanded = false
    var transaction: Transaction
      var body: some View {
          VStack {
              HStack {
                  CategoryView(category: transaction.TransactionCategory)

                  Text(transaction.name)

                  Spacer()
                  VStack {
                      Text("\(transaction.price)")

                      Text("\(transaction.descriptions.count) операция")
                          .font(.system(size: 10))
                          .foregroundStyle(.gray)
                  }
                  Image(systemName: "chevron.down")
                      .rotationEffect(self.isCellExpanded ? Angle(degrees: -180) : .zero)
              }.onTapGesture {
                  withAnimation {
                      self.isCellExpanded.toggle()
                  }
              }

              if self.isCellExpanded {
                  var counter = 1
                  ForEach(Array(transaction.descriptions.enumerated()), id: \.element.name) { (index, transaction) in
                      HStack {
                          VStack {
                              Text("\(transaction.name)")
                          }
                          Spacer()

                          Text("\(transaction.price)")
                      }
                      .frame(height: 15)
                      .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))

                      if index != transaction.descriptions.count - 1 {
                          Divider().background(Color.gray)
                      }
                  }
              }
          }
          .scaleEffect(self.isCellExpanded ? 1.05 : 1.0)
      }
}
