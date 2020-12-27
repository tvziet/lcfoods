class NotificationsController < ApplicationController
  def index
    @page_notifications        = Notification.all
    @pagy, @page_notifications = pagy(@page_notifications)
  end

  def show
    @page_notification = Notification.friendly.find(params["id"])
  end
end