class UsersController < ApplicationController
  def index
    @page_users        = User.all.order(created_at: :desc)
    @pagy, @page_users = pagy(@page_users)
  end

  def show
    @page_user = User.find(params[:id])
  end
end