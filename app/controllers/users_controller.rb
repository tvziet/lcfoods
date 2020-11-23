class UsersController < ApplicationController
  def index
    @pagy, @page_users = pagy(User.all.order(created_at: :desc))
  end

  def show
    @page_user = User.find(params[:id])
  end
end