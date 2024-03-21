import Foundation
import UIKit

class DataManager {
    static let shared = DataManager()

    private init() { }

    let generalCardsMainProfile: [GeneralCardMainProfileView] = [
        GeneralCardMainProfileView(
            nameCard: Resources.Strings.GeneralCardsProfile.setting,
            imageCard: Resources.Images.GeneralCardsProfile.setting!,
            colorLogo: Resources.Colors.GeneralCardsProfile.setting
        ),
        GeneralCardMainProfileView(
            nameCard: Resources.Strings.GeneralCardsProfile.favorites,
            imageCard: Resources.Images.GeneralCardsProfile.favorites!,
            colorLogo: Resources.Colors.GeneralCardsProfile.favorites
        ),
        GeneralCardMainProfileView(
            nameCard: Resources.Strings.GeneralCardsProfile.notification,
            imageCard: Resources.Images.GeneralCardsProfile.notification!,
            colorLogo: Resources.Colors.GeneralCardsProfile.notification
        ),
    ]

    let securityCardsSetting: [SecurityCardSettingView] = [
        SecurityCardSettingView(
            cardName: Resources.Strings.SecurityCardsProfile.appsPassword,
            image: Resources.Images.SecurityCardsProfile.appsPassword!,
            color: Resources.Colors.SecurityCardsSetting.appsPassword
        ),
        SecurityCardSettingView(
            cardName: Resources.Strings.SecurityCardsProfile.changePassword,
            image: Resources.Images.SecurityCardsProfile.changePassword!,
            color: Resources.Colors.SecurityCardsSetting.changePassword
        ),
        SecurityCardSettingView(
            cardName: Resources.Strings.SecurityCardsProfile.notification,
            image: Resources.Images.SecurityCardsProfile.notification!,
            color: Resources.Colors.SecurityCardsSetting.notification
        )
    ]

    let changeDataCards: [ChangeDataUserCardView] = [
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

}
