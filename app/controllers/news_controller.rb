class NewsController < ApplicationController
  def index
    @pagy, @page_all_news = pagy(News.all.order(created_at: :desc))
  end

  def show
    @page_news = News.find(params[:id])
  end
end