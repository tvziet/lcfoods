class Admin::AdministratorsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @companies      = Company.all.order(created_at: :desc)
    @users          = User.all.order(created_at: :desc).limit(10)
    @categories     = Category.all.order(created_at: :desc)
    @regulations    = Regulation.all.order(created_at: :desc).limit(10)
    @notifications  = Notification.all.order(created_at: :desc).limit(10)
  end

  def search
    if params['search']
      @pagy, @search_results_regulations = pagy(Regulation.search_regulation(params['search']).order(created_at: :desc))
    else
      @pagy, @search_results_regulations = pagy(Regulation.all.order(created_at: :desc))
    end
  end
end
