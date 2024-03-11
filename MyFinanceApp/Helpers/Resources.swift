import UIKit

enum Resources {
    enum Colors {
        static var active = UIColor(hexString: "#373062")

        static var mainColorApp = UIColor(hexString: "#373062")

        static var inactive  = UIColor(hexString: "#bdbdbd")
        
        static var separator = UIColor(hexString: "bdbdbd")

        static var backgroundViews = UIColor(hexString: "#f7f7f7")
    }

    enum Strings {
        enum TabBar {
            static var myMoney = "Мои деньги"
            static var budget = "Бюджет"
            static var lenta = "Лента"
            static var courses = "Курсы"
            static var profile = "Профиль"
        }

        enum GeneralCardsProfile {
            static var setting = "Настройки"
            static var favorites = "Избранные"
            static var notification = "Уведомления"
        }

        enum SecurityCardsProfile {
            static var codePassword = "Код-пароль"
            static var changePassword = "Изменить пароль"
            static var notification = "Push-Уведомления"
        }
    }

    enum Images {
        enum TabBar {
            static var myMoney = UIImage(named: "general")
            static var budget = UIImage(named: "budget")
            static var lenta = UIImage(named: "lenta")
            static var courses = UIImage(named: "courses")
            static var profile = UIImage(named: "profile")
        }

        enum GeneralCardsProfile {
            static var setting = UIImage(named: "setting")
            static var favorites = UIImage(named: "favorites")
            static var notification = UIImage(named: "notification")
        }

        enum SecurityCardsProfile {
            static var codePassword = UIImage(named: "faceid")
            static var changePassword = UIImage(named: "changePassword")
            static var notification = UIImage(named: "notificationSecurity")
        }
    }

    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
