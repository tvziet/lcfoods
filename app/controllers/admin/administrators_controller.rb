class Admin::AdministratorsController < ApplicationController
  include Searchable
  before_action :authenticate_admin!
  def index
    @groups         = Group.all.order(created_at: :desc).limit(10)
    @users          = User.all.includes([:group]).order(created_at: :desc).limit(10)
    @categories     = Category.all.order(created_at: :desc).limit(10)
    @regulations    = Regulation.all.order(created_at: :desc).limit(10)
    @notifications  = Notification.all.order(created_at: :desc).limit(10)
    @documents      = Document.all.order(created_at: :desc).limit(10)
    @news           = News.all.order(created_at: :desc).limit(10)
  end

  def search
    @array_of_result_objects = Searchable.filter(params["search"]) if params["search"]
  end
end
