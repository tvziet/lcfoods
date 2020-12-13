class Admin::NewsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_news, only: %i[show edit update destroy]

  def index
    @pagy, @all_news = pagy(News.all.order(created_at: :desc))
  end

  def show; end

  def new
    @news = News.new
  end

  def edit; end

  def create
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
        format.html { redirect_to tat_ca_tin_tuc_path, notice: 'Tin tức đã được tạo thành công.' }
      else
        format.html { redirect_to them_moi_tin_tuc_path, alert: "#{@news.errors.full_messages.join('\n').html_safe}" }
      end
    end
  end

  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to tat_ca_tin_tuc_path, notice: 'Tin tức đã được cập nhật thành công.' }
      else
        format.html { redirect_to cap_nhat_tin_tuc_path, alert: "#{@news.errors.full_messages.join('\n').html_safe}" }
      end
    end
  end

  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to tat_ca_tin_tuc_path, notice: 'Tin tức đã được xoá thành công.' }
    end
  end

  def search
    if params["search"]
      @pagy, @search_results_news = pagy(News.where('lower(title) LIKE ?', "%#{params["search"]}%").order(created_at: :desc))
    else
      @pagy, @search_results_news = pagy(News.all.order(created_at: :desc))
    end
  end

  private
  def set_news
    @news = News.friendly.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title, :body, :status)
  end
end
