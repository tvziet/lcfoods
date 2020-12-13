class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @pagy, @categories = pagy(Category.all.includes([:group]).order(created_at: :desc))
  end

  def show
    @pagy, @regulations_of_category = pagy(Regulation.includes([:group, :category]).where(category_id: @category.id).order(created_at: :desc))
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to tat_ca_danh_muc_path, notice: 'Danh mục đã được tạo thành công.' }
      else
        format.html { redirect_to them_moi_danh_muc_path, alert: "#{@category.errors.full_messages.join('\n').html_safe}" }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to tat_ca_danh_muc_path, notice: 'Danh mục đã được cập nhật thành công.' }
      else
        format.html { redirect_to cap_nhat_danh_muc_path(@category), alert: "#{@category.errors.full_messages.join('\n').html_safe}" }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to tat_ca_danh_muc_path, notice: 'Danh mục đã được xoá thành công.' }
    end
  end

  private
  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :group_id)
  end
end
