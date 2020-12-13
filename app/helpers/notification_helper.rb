module NotificationHelper
  def five_notable_notifications
    all_notable_notifications  = Notification.notable.order(created_at: :desc)
    five_notable_notifications = all_notable_notifications.limit(5) if all_notable_notifications.any?
  end
end