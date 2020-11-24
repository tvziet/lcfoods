class NotificationsController < ApplicationController
  def index
    @pagy, @page_notifications = pagy(Notification.all.order(created_at: :desc))
  end

  def show
    @page_notification = Notification.find(params[:id])
  end

  def company_notifications
    @page_company               = Company.find_by(id: params[:id])
    @pagy, @company_notifications = pagy(Notification.where(company_id: @page_company&.id))
  end
end