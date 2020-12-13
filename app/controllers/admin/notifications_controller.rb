class Admin::NotificationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_notification, only: %i[show edit update destroy]

  def index
    @pagy, @notifications = pagy(Notification.all.order(created_at: :desc))
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
        format.html { redirect_to thong_bao_path, notice: 'Thông báo đã được tạo thành công.' }
      else
        format.html { redirect_to them_moi_thong_bao_path, alert: "#{@notification.errors.full_messages.join('\n').html_safe}" }
      end
    end
  end

  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to thong_bao_path, notice: 'Thông báo đã được cập nhật thành công.' }
      else
        format.html { redirect_to cap_nhat_thong_bao_path, alert: "#{@notification.errors.full_messages.join('\n').html_safe}" }
      end
    end
  end

  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to thong_bao_path, notice: 'Thông báo đã được xoá thành công.' }
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
    @notification = Notification.friendly.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(:title, :body, :status, :category_id, attachments:[])
  end
end
