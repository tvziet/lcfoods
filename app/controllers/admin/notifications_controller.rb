class Admin::NotificationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_notification, only: %i[show edit update destroy]

  def index
    @notifications = Notification.all
  end

  def show; end

  def new
    @notification = Notification.new
  end

  def edit; end

  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to admin_notifications_url, notice: 'Thông báo đã được tạo thành công.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to admin_notifications_url, notice: 'Thông báo đã được cập nhật thành công.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to admin_notifications_url, notice: 'Thông báo đã được xoá thành công.' }
      format.json { head :no_content }
    end
  end

  def search
    if params["search"]
      @pagy, @search_results_notifications = pagy(Notification.where('lower(title) LIKE ?', "%#{params["search"]}%").order(created_at: :desc))
    else
      @pagy, @search_results_notifications = pagy(Notification.all.order(created_at: :desc))
    end
  end

  private
  def set_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(:title, :body, :status, :company_id, :category_id)
  end
end
