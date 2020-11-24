class GroupsController < ApplicationController
  def show
    @page_group            = Group.find_by(id: params[:id])
    @pagy, @users_of_group = pagy(User.where(group_id: @page_group&.id).where(company_id: @page_group.company_id))
  end
end