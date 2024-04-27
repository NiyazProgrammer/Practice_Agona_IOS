import UIKit

enum Resources {
    enum Colors {
        static let active = UIColor(hexString: "#373062")
        static let mainColorApp = UIColor(hexString: "#373062")
        static let inactive  = UIColor(hexString: "#bdbdbd")
        static let separator = UIColor(hexString: "bdbdbd")
        static let backgroundViews = UIColor(hexString: "#f7f7f7")

        enum GeneralCardsProfile {
            static let setting: UIColor = .lightGray
            static let favorites = UIColor(hexString: "#fef5e4")
            static let notification = UIColor(hexString: "#feeaeb")
        }

        enum SecurityCardsSetting {
            static let appsPassword: UIColor = .green
            static let changePassword: UIColor = .lightGray
            static let notification = UIColor(hexString: "#f84608")
        }
    }
    
    enum Strings {
        enum TabBar {
            static var myMoney = "Мои деньги"
            static let budget = "Бюджет"
            static let lenta = "Лента"
            static let courses = "Курсы"
            static let profile = "Профиль"
        }

        enum GeneralCardsProfile {
            static let setting = "Настройки"
            static let favorites = "Избранные"
            static let notification = "Уведомления"
        }

        enum SecurityCardsProfile {
            static let appsPassword = "Код-пароль"
            static let changePassword = "Изменить пароль"
            static let notification = "Push-Уведомления"
        }

        enum ChangeDataCards {
            enum TitleCard {
                static let lastName = "Фамилия"
                static let firstName = "Имя"
                static let middleName = "Отчество"
                static let email = "E-mail"
                static let nameUser = "Имя пользователя"
            }
            enum PlaceholderCard {
                static let lastName = "Введите фамилию"
                static let firstName = "Введите имя"
                static let middleName = "Введите отчество"
                static let email = "Введите Email "
                static let nameUser = "@User12345"
            }
        }

        enum ChangePasswordCards {
            enum PlaceholderCard {
                static let currentPassword = "Ваш текущий пароль"
                static let newPassword = "Придумайте новый пароль"
                static let confirmNewPassword = "Подтвердите новый пароль"
            }
        }

        static let all: [String] = ["Лента", "Валюта"]
    }

    enum Images {

        static let mainAppIcon = UIImage(named: "LaunchImage")

        enum TabBar {
            static let myMoney = UIImage(named: "general")
            static let budget = UIImage(named: "budget")
            static let lenta = UIImage(named: "lenta")
            static let courses = UIImage(named: "courses")
            static let profile = UIImage(named: "profile")
        }

        enum GeneralCardsProfile {
            static let setting = UIImage(named: "setting")
            static let favorites = UIImage(named: "favorites")
            static let notification = UIImage(named: "notification")
        }

        enum SecurityCardsProfile {
            static let appsPassword = UIImage(named: "faceid")
            static let changePassword = UIImage(named: "changePassword")
            static let notification = UIImage(named: "notificationSecurity")
            static let rightArrow = UIImage(named: "rightArrow")
        }

        enum ChangeDataCards {
            static let editPencil = UIImage(named: "editPencil")
            static let editCamera = UIImage(named: "editCamera")
            static let defaultAvatar = UIImage(named: "defaultAvatar")
        }
    }

    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
