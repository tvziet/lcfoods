class UsersController < ApplicationController
  def index
    @page_users = User.all.order(created_at: :desc)
    if params["search"]
      @pagy, @page_users = pagy(@page_users.where('lower(first_name) LIKE ?', "%#{params["search"]}%")
                                                         .or(@page_users.where('lower(last_name) LIKE ?', "%#{params["search"]}%"))
                                                         .or(@page_users.where('lower(employee_number) LIKE ?', "%#{params["search"]}%")))
    else
      @pagy, @page_users = pagy(@page_users)
    end
  end

  def show
    @page_user = User.find(params[:id])
  end
end