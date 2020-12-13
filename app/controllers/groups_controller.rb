class GroupsController < ApplicationController
  def show
    @page_group                     = Group.friendly.find(params["id"])
    @pagy, @users_of_group          = pagy(User.where(group_id: @page_group&.id).order(created_at: :desc))
  end
end
