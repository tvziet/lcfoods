class NewsController < ApplicationController
  def index
    @page_all_news        = News.all
    @pagy, @page_all_news = pagy(@page_all_news)
  end

  def show
    @page_news = News.friendly.find(params[:id])
  end
end