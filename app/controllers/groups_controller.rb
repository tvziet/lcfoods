class GroupsController < ApplicationController
  def show
    @page_group                     = Group.friendly.find(params["id"])
    @pagy, @users_of_group          = pagy(User.includes([:group]).where(group_id: @page_group&.id))
  end
end
