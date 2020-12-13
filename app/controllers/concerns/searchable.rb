module Searchable
  extend ActiveSupport::Concern
  class << self
    def search_user(query)
      array_of_result_users  = []
      users_by_full_name     = User.search_by_full_name(query)
      users_by_employ_number = User.search_by_employee_number(query)
      users_by_email         = User.search_by_email(query)
      users_by_cell_phone    = User.search_by_cell_phone(query)
      users_by_birthday      = User.search_by_birthday(query)
      array_of_result_users  << users_by_full_name if users_by_full_name
      array_of_result_users  << users_by_employ_number if users_by_employ_number
      array_of_result_users  << users_by_email if users_by_email
      array_of_result_users  << users_by_cell_phone if users_by_cell_phone
      array_of_result_users  << users_by_birthday if users_by_birthday
      array_of_result_users = User.where(id: array_of_result_users.map(&:ids).flatten.uniq)
    end

    def search_regulation(query)
      array_of_result_regulations = []
      regulations_by_title        = Regulation.search_by_title(query)
      if regulations_by_title
        array_of_result_regulations << regulations_by_title 
        array_of_result_regulations = Regulation.where(id: array_of_result_regulations.map(&:ids).flatten.uniq)
      end
    end

    def search_notification(query)
      array_of_result_notifications = []
      notifications_by_title        = Notification.search_by_title(query)
      if notifications_by_title
        array_of_result_notifications << notifications_by_title
        array_of_result_notifications = Notification.where(id: array_of_result_notifications.map(&:ids).flatten.uniq)
      end
    end

    def search_document(query)
      array_of_result_documents = []
      documents_by_title        = Document.search_by_title(query)
      if documents_by_title
        array_of_result_documents << documents_by_title
        array_of_result_documents = Document.where(id: array_of_result_documents.map(&:ids).flatten.uniq)
      end
    end

    def search_news(query)
      array_of_result_news = []
      news_by_title        = News.search_by_title(query)
      if news_by_title.any?
        array_of_result_news << news_by_title
        array_of_result_news = News.where(id: array_of_result_news.map(&:ids).flatten.uniq)
      end
    end

    def search_group(query)
      array_of_result_groups = []
      groups_by_name         = Group.search_by_name(query)
      if groups_by_name
        array_of_result_groups << groups_by_name 
        array_of_result_groups = Group.where(id: array_of_result_groups.map(&:ids).flatten.uniq)
      end
    end

    def filter(query)
    array_of_result_objects       = []
    array_of_result_users         = Searchable.search_user(query) if query
    array_of_result_regulations   = Searchable.search_regulation(query) if query
    array_of_result_notifications = Searchable.search_notification(query) if query
    array_of_result_documents     = Searchable.search_document(query) if query
    array_of_result_news          = Searchable.search_news(query) if query
    array_of_result_groups        = Searchable.search_group(query) if query
    array_of_result_objects << array_of_result_users if array_of_result_users
    array_of_result_objects << array_of_result_regulations if array_of_result_regulations
    array_of_result_objects << array_of_result_notifications if array_of_result_notifications
    array_of_result_objects << array_of_result_documents if array_of_result_documents
    array_of_result_objects << array_of_result_news if array_of_result_news
    array_of_result_objects << array_of_result_groups if array_of_result_groups
    array_of_result_objects
    end
  end
end