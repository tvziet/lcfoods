class HomeController < ApplicationController
  def index
    # CAROUSELS
    @first_carousel           = Carousel.active.order(created_at: :desc).first
    @recently_active_carousel = Carousel.active.order(created_at: :desc).where.not(id: @first_carousel.id)
    # REGULATIONS
    @first_notable_regulation     = Regulation.notable.order(created_at: :desc).first
    @recently_notable_regulations = Regulation.notable.order(created_at: :desc).where.not(id: @first_notable_regulation.id)
    # NEWS
    @first_notable_news    = News.notable.order(created_at: :desc).first
    @recently_notable_news = News.notable.order(created_at: :desc).where.not(id: @first_notable_news.id)
    # NOTIFICATIONS
    @first_notable_notification      = Notification.notable.order(created_at: :desc).first
    @recently_notable_notificationss = Notification.notable.order(created_at: :desc).where.not(id: @first_notable_notification.id)
  end

  def search
    # CAROUSELS
    @first_carousel           = Carousel.active.order(created_at: :desc).first
    @recently_active_carousel = Carousel.active.order(created_at: :desc).where.not(id: @first_carousel.id)
    if params["search"]
      @pagy, @search_results_regulations = pagy(Regulation.where('lower(title) LIKE ?', "%#{params["search"]}%").order(created_at: :desc))
    else
      @pagy, @search_results_regulations = pagy(Regulation.all.order(created_at: :desc))
    end
  end
end
