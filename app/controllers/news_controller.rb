class NewsController < ApplicationController
  def index
    @page_all_news        = News.all.order(created_at: :desc)
    @pagy, @page_all_news = pagy(@page_all_news)
  end

  def show
    @page_news = News.find(params[:id])
  end
end