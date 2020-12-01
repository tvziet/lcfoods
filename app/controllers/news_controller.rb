class NewsController < ApplicationController
  def index
    @page_all_news = News.all.order(created_at: :desc)
    if params["search"]
      @pagy, @page_all_news = pagy(@page_all_news.where('lower(title) LIKE ?', "%#{params["search"]}%"))
    else
      @pagy, @page_all_news = pagy(@page_all_news)
    end
  end

  def show
    @page_news = News.find(params[:id])
  end
end