class GroupsController < ApplicationController
  def show
    @page_group     = Group.find_by(id: params[:id])
    @users_of_group = User.where(group_id: @page_group&.id).where(company_id: @page_group.company_id).order(created_at: :desc)
    if params["search"]
      @pagy, @search_results_users = pagy(@users_of_group.where('lower(first_name) LIKE ?', "%#{params["search"]}%")
                                                         .or(@users_of_group.where('lower(last_name) LIKE ?', "%#{params["search"]}%"))
                                                         .or(@users_of_group.where('lower(employee_number) LIKE ?', "%#{params["search"]}%")))
    else
      @pagy, @search_results_users = pagy(@users_of_group)
    end
  end
end
