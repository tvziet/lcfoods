class HomeController < ApplicationController
  def index
    # CAROUSELS
    all_carousels                        = Carousel.active.order(created_at: :desc)
    @first_carousel                      = all_carousels.first
    @recently_active_carousel            = all_carousels.where.not(id: @first_carousel.id)

    # REGULATIONS
    all_notable_regulation               = Regulation.notable.order(created_at: :desc)
    @first_notable_regulation            = all_notable_regulation.first
    @recently_notable_regulations        = all_notable_regulation.where.not(id: @first_notable_regulation.id).limit(5)

    # NEWS
    all_notable_news                     = News.notable.order(created_at: :desc)
    @first_notable_news                  = all_notable_news.first
    @recently_notable_news               = all_notable_news.where.not(id: @first_notable_news.id).limit(5)

    # NOTIFICATIONS
    all_notable_notifications            = Notification.notable.order(created_at: :desc)
    @first_notable_notification          = all_notable_notifications.first
    @recently_notable_notifications      = all_notable_notifications.where.not(id: @first_notable_notification.id).limit(5)

    # DOCUMENTS
    all_documents                        = Document.all.order(created_at: :desc)
    @first_document                      = all_documents.first
    @recently_documents                  = all_documents.where.not(id: @first_document.id).limit(5)
  end

  def search
    # CAROUSELS
    @first_carousel                      = Carousel.active.order(created_at: :desc).first
    @recently_active_carousel            = Carousel.active.order(created_at: :desc).where.not(id: @first_carousel.id)
    if params["search"]
      @pagy, @search_results_regulations = pagy(Regulation.where('lower(title) LIKE ?', "%#{params["search"]}%").order(created_at: :desc))
    else
      @pagy, @search_results_regulations = pagy(Regulation.all.order(created_at: :desc))
    end
  end
end
