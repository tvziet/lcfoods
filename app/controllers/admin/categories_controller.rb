class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_category, only: %i[show edit update destroy]
  # before_action :check_admin, except: %i[index show]

  def index
    @pagy, @categories = pagy(Category.all.order(created_at: :desc))
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to tat_ca_danh_muc_path, notice: 'Danh mục đã được tạo thành công.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to tat_ca_danh_muc_path, notice: 'Danh mục đã được cập nhật thành công.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to tat_ca_danh_muc_path, notice: 'Danh mục đã được xoá thành công.' }
      format.json { head :no_content }
    end
  end

  private
  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def check_admin
    return unless current_admin.is_super_admin?
  end
end
