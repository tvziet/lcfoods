class NotificationsController < ApplicationController
  def index
    @pagy, @page_notifications = pagy(Notification.all.order(created_at: :desc))
  end

  def show
    @page_notification = Notification.find(params[:id])
  end

  def company_notifications
    @page_company          = Company.find_by(id: params[:id])
    @company_notifications = Notification.where(company_id: @page_company&.id).order(created_at: :desc)
    if params["search"]
      @pagy, @search_notifications = pagy(@company_notifications.where('lower(title) LIKE ?', "%#{params["search"]}%"))
    else
      @pagy, @search_notifications = pagy(@company_notifications)
    end
  end
end