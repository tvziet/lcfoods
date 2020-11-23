class Admin::NewsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_news, only: %i[show edit update destroy]

  def index
    @all_news = News.all
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
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to tat_ca_tin_tuc_path, notice: 'Tin tức đã được cập nhật thành công.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to tat_ca_tin_tuc_path, notice: 'Tin tức đã được xoá thành công.' }
      format.json { head :no_content }
    end
  end

  private
  def set_news
    @news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title, :body, :status)
  end
end
