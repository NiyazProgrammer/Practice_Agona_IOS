//
//  Favorites.swift
//  MyFinanceApp
//
//  Created by Нияз Ризванов on 05.03.2024.
//

import Foundation
import UIKit

class FavoritesViewModel {
    private var newsCards: [News] =
    [
        .init(
            id: 1,
            shortDescription: "Яндекс занял первое место в рейтинге самых дорогих компаний Рунета",
            date: Date.now,
            picture: UIImage(named: "backgroundImageProfile") ?? UIImage(),
            likesCount: 10,
            likedByUsers: [User(id: 1, email: "", firstName: "", lastName: "", middleName: "", userName: "")]
        ),
        .init(
            id: 1,
            shortDescription: "Яндекс занял первое место в рейтинге самых дорогих компаний Рунета",
            date: Date.now,
            picture: UIImage(named: "backgroundImageProfile") ?? UIImage(),
            likesCount: 10,
            likedByUsers: [User(id: 1, email: "", firstName: "", lastName: "", middleName: "", userName: "")]
        ),
        .init(
            id: 1,
            shortDescription: "Яндекс занял первое место в рейтинге самых дорогих компаний Рунета",
            date: Date.now,
            picture: UIImage(named: "backgroundImageProfile") ?? UIImage(),
            likesCount: 10,
            likedByUsers: [User(id: 1, email: "", firstName: "", lastName: "", middleName: "", userName: "")]
        ),
        .init(
            id: 1,
            shortDescription: "Яндекс занял первое место в рейтинге самых дорогих компаний Рунета",
            date: Date.now,
            picture: UIImage(named: "backgroundImageProfile") ?? UIImage(),
            likesCount: 10,
            likedByUsers: [User(id: 1, email: "", firstName: "", lastName: "", middleName: "", userName: "")]
        ),
        .init(
            id: 1,
            shortDescription: "Яндекс занял первое место в рейтинге самых дорогих компаний Рунета",
            date: Date.now,
            picture: UIImage(named: "backgroundImageProfile") ?? UIImage(),
            likesCount: 10,
            likedByUsers: [User(id: 1, email: "", firstName: "", lastName: "", middleName: "", userName: "")]
        )
    ]

    func getFirstNews() -> [News]{
        return newsCards
    }
}
