//
//  DescriptionNotificatiionViewModel.swift
//  MyFinanceApp
//
//  Created by Нияз Ризванов on 10.04.2024.
//

import UIKit

class DescriptionNotificatiionViewModel {
    private var descriptionNotificatiion: Notification

    init(descriptionNotificatiion: Notification) {
        self.descriptionNotificatiion = descriptionNotificatiion
    }

    func setDescriptionNotification() -> Notification {
        return descriptionNotificatiion
    }
}
