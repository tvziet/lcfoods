class Admin::RegulationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_regulation, only: %i[show edit update destroy]

  def index
    @pagy, @regulations = pagy(Regulation.all.includes([:group, :category]).order(created_at: :desc))
  end

  def show; end

  def new
    @regulation = Regulation.new
  end

  def edit; end

  def create
    @regulation = Regulation.new(regulation_params)

    respond_to do |format|
      if @regulation.save
        format.html { redirect_to quy_dinh_quy_trinh_path, notice: 'Quy định, quy trình đã được tạo thành công.' }
      else
        format.html { redirect_to quy_dinh_quy_trinh_path, alert: "#{@regulation.errors.full_messages.join('\n').html_safe}" }
      end
    end
  end

  def update
    respond_to do |format|
      if @regulation.update(regulation_params)
        format.html { redirect_to quy_dinh_quy_trinh_path, notice: 'Quy định, quy trình đã được cập nhật thành công.' }
      else
        format.html { redirect_to cap_nhat_quy_dinh_quy_trinh_path(@regulation), alert: "#{@regulation.errors.full_messages.join('\n').html_safe}" }
      end
    end
  end

  def destroy
    @regulation.destroy
    respond_to do |format|
      format.html { redirect_to quy_dinh_quy_trinh_path, notice: 'Quy định, quy trình đã được xoá thành công.' }
    end
  end

  private
  def set_regulation
    @regulation = Regulation.friendly.find(params[:id])
  end

  def regulation_params
    params.require(:regulation).permit(:title, :body, :status, :category_id, :group_id, attachments: [])
  end
end
