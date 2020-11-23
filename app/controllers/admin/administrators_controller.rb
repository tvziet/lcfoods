class Admin::AdministratorsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @companies      = Company.all.order(created_at: :desc)
    @users          = User.all.order(created_at: :desc)
    @categories     = Category.all.order(created_at: :desc)
    @regulations    = Regulation.all.order(created_at: :desc)
    @notifications  = Notification.all.order(created_at: :desc)
  end
end
