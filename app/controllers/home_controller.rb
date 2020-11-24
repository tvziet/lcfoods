class HomeController < ApplicationController
  def index
    # CAROUSELS
    @carousels = Carousel.active.order(created_at: :desc)
    # REGULATIONS
    @first_notable_regulation = Regulation.notable.order(created_at: :desc).first
    @recently_notable_regulations = Regulation.notable.order(created_at: :desc).where.not(id: @first_notable_regulation&.id)
    # NEWS
    @first_notable_news = News.notable.order(created_at: :desc)&.first
    @recently_notable_news = News.notable.order(created_at: :desc).where.not(id: @first_notable_news&.id)
    # NOTIFICATIONS
    @first_notable_notification = Notification.notable.order(created_at: :desc).first
    @recently_notable_notificationss = Notification.notable.order(created_at: :desc).where.not(id: @first_notable_notification&.id)

  end
end
