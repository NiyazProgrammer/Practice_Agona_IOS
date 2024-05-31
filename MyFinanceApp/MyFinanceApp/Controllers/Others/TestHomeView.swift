//
//  TestHomeView.swift
//  MyFinanceApp
//
//  Created by Нияз Ризванов on 30.05.2024.
//

import SwiftUI

struct TestHomeView: View {
    var user: User

    var body: some View {
        VStack {
            Text("Welcome, \(user.userName)!")
                .font(.largeTitle)
                .padding()

            Spacer()
        }
    }
}

