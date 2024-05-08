import Foundation

class NotificationViewModel {
    private var notifications: [Notification]

    init(notifications: [Notification]) {
        self.notifications = notifications
    }

    func updateNotifications() -> [Notification] {
        return notifications
    }
}
