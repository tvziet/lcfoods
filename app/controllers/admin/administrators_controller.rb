class Admin::AdministratorsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @companies      = Company.all.order(created_at: :desc)
    @groups         = Group.all.includes([:company]).order(created_at: :desc).limit(10)
    @users          = User.all.includes([:group, :company]).order(created_at: :desc).limit(10)
    @categories     = Category.all.order(created_at: :desc).limit(10)
    @regulations    = Regulation.all.order(created_at: :desc).limit(10)
    @notifications  = Notification.all.order(created_at: :desc).limit(10)
  end

  def search
    @array_of_result_objects      = []
    array_of_result_users         = []
    array_of_result_regulations   = []
    array_of_result_notifications = []
    array_of_result_documents     = []
    array_of_result_news          = []
    @count_result                 = 0
    if params['search']
      array_of_result_users = search_user(params['search'], array_of_result_users)
      search_regulation(params['search'], array_of_result_regulations)
      search_notification(params['search'], array_of_result_notifications)
      search_document(params['search'], array_of_result_documents)
      search_news(params['search'], array_of_result_news)
    end
    @array_of_result_objects << array_of_result_users if array_of_result_users.any?
    @array_of_result_objects << array_of_result_regulations if array_of_result_regulations.any?
    @array_of_result_objects << array_of_result_notifications if array_of_result_notifications.any?
    @array_of_result_objects << array_of_result_documents if array_of_result_documents.any?
    @array_of_result_objects << array_of_result_news if array_of_result_news.any?
  end

  def search_user(query, array_of_result_users)
    users_by_full_name     = User.search_by_full_name(query)
    users_by_employ_number = User.search_by_employee_number(query)
    users_by_email         = User.search_by_email(query)
    users_by_cell_phone    = User.search_by_cell_phone(query)
    users_by_birthday      = User.search_by_birthday(query)
    array_of_result_users  << users_by_full_name if users_by_full_name.any?
    array_of_result_users  << users_by_employ_number if users_by_employ_number.any?
    array_of_result_users  << users_by_email if users_by_email.any?
    array_of_result_users  << users_by_cell_phone if users_by_cell_phone.any?
    array_of_result_users  << users_by_birthday if users_by_birthday.any?
    array_of_result_users = User.where(id: array_of_result_users.map(&:ids).flatten.uniq)
  end

  def search_regulation(query, array_of_result_regulations)
    regulations_by_title        = Regulation.search_by_title(query)
    array_of_result_regulations << regulations_by_title if regulations_by_title.any?
    array_of_result_regulations = Regulation.where(id: array_of_result_regulations.map(&:ids).flatten.uniq)
  end

  def search_notification(query, array_of_result_notifications)
    notifications_by_title        = Notification.search_by_title(query)
    array_of_result_notifications << notifications_by_title if notifications_by_title.any?
    # array_of_result_notifications = Notification.where(id: array_of_result_notifications.map(&:ids).flatten.uniq)
    array_of_result_notifications
  end

  def search_document(query, array_of_result_documents)
    documents_by_title        = Document.search_by_title(query)
    array_of_result_documents << documents_by_title if documents_by_title.any?
    # array_of_result_documents = Document.where(id: array_of_result_documents.map(&:ids).flatten.uniq)
    array_of_result_documents
  end

  def search_news(query, array_of_result_news)
    news_by_title        = News.search_by_title(query)
    array_of_result_news << news_by_title if news_by_title.any?
    # array_of_result_news = News.where(id: array_of_result_news.map(&:ids).flatten.uniq)
    array_of_result_news
  end
end
