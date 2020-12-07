class NotificationsController < ApplicationController
  def index
    @page_notifications        = Notification.all.order(created_at: :desc)
    @pagy, @page_notifications = pagy(@page_notifications)
  end

  def show
    @page_notification = Notification.friendly.find(params["id"])
  end

  def company_notifications
    @page_company                = Company.friendly.find(params["id"])
    @company_notifications       = Notification.where(company_id: @page_company&.id).order(created_at: :desc)
    @pagy, @search_notifications = pagy(@company_notifications)
  end
end