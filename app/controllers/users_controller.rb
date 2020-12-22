class UsersController < ApplicationController
  def index
    # @page_users        = User.all.includes([avatar_attachment: :blob]).includes(:group).order(created_at: :desc)
    @page_users        = User.all.includes(:group).order(created_at: :desc)
    @pagy, @page_users = pagy(@page_users)
  end

  def show
    @page_user = User.friendly.find(params["id"])
  end
end