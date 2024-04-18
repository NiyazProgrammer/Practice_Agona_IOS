import Foundation
import UIKit

/// Пока не готовый DataManager, нужно будет исправлять
class DataManager {

    let generalCardsMainProfile: [GeneralCardMainProfileView] = [
        GeneralCardMainProfileView(
            nameCard: Resources.Strings.GeneralCardsProfile.setting,
            imageCard: Resources.Images.GeneralCardsProfile.setting ?? UIImage(),
            colorLogo: Resources.Colors.GeneralCardsProfile.setting
        ),
        GeneralCardMainProfileView(
            nameCard: Resources.Strings.GeneralCardsProfile.favorites,
            imageCard: Resources.Images.GeneralCardsProfile.favorites ?? UIImage(),
            colorLogo: Resources.Colors.GeneralCardsProfile.favorites
        ),
        GeneralCardMainProfileView(
            nameCard: Resources.Strings.GeneralCardsProfile.notification,
            imageCard: Resources.Images.GeneralCardsProfile.notification ?? UIImage(),
            colorLogo: Resources.Colors.GeneralCardsProfile.notification
        )
    ]

    let securityCardsSetting: [SecurityCardSettingView] = [
        SecurityCardSettingView(
            cardName: Resources.Strings.SecurityCardsProfile.appsPassword,
            image: Resources.Images.SecurityCardsProfile.appsPassword ?? UIImage(),
            color: Resources.Colors.SecurityCardsSetting.appsPassword
        ),
        SecurityCardSettingView(
            cardName: Resources.Strings.SecurityCardsProfile.changePassword,
            image: Resources.Images.SecurityCardsProfile.changePassword ?? UIImage(),
            color: Resources.Colors.SecurityCardsSetting.changePassword
        ),
        SecurityCardSettingView(
            cardName: Resources.Strings.SecurityCardsProfile.notification,
            image: Resources.Images.SecurityCardsProfile.notification ?? UIImage(),
            color: Resources.Colors.SecurityCardsSetting.notification
        )
    ]

    let changeDataUsersCards: [ChangeDataUserCardView] = [
        ChangeDataUserCardView(
            cardName: Resources.Strings.ChangeDataCards.TitleCard.lastName,
            textPlaceholder: Resources.Strings.ChangeDataCards.PlaceholderCard.lastName
        ),
        ChangeDataUserCardView(
            cardName: Resources.Strings.ChangeDataCards.TitleCard.firstName,
            textPlaceholder: Resources.Strings.ChangeDataCards.PlaceholderCard.firstName
        ),
        ChangeDataUserCardView(
            cardName: Resources.Strings.ChangeDataCards.TitleCard.middleName,
            textPlaceholder: Resources.Strings.ChangeDataCards.PlaceholderCard.middleName
        ),
        ChangeDataUserCardView(
            cardName: Resources.Strings.ChangeDataCards.TitleCard.email,
            textPlaceholder: Resources.Strings.ChangeDataCards.PlaceholderCard.email
        ),
        ChangeDataUserCardView(
            cardName: Resources.Strings.ChangeDataCards.TitleCard.nameUser,
            textPlaceholder: Resources.Strings.ChangeDataCards.PlaceholderCard.nameUser
        )
    ]

    let changePasswordUsersCards: [ChangePasswordCard] = [
        ChangePasswordCard(textPlaceholder: Resources.Strings.ChangePasswordCards.PlaceholderCard.currentPassword
        ),
        ChangePasswordCard(textPlaceholder: Resources.Strings.ChangePasswordCards.PlaceholderCard.newPassword
        ),
        ChangePasswordCard(textPlaceholder: Resources.Strings.ChangePasswordCards.PlaceholderCard.confirmNewPassword
        )
    ]

    var notifications: [Notification] = [
        .init(description: "Push 1", image: nil, dateInfo: Date.now),
        .init(description: "Push 2", image: nil, dateInfo: Date.now),
        .init(description: "Push 3", image: nil, dateInfo: Date.now),
        .init(description: "Push 4", image: nil, dateInfo: Date.now),
        .init(description: "Push 5", image: nil, dateInfo: Date.now)
    ]
}
