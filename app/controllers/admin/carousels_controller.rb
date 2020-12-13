class Admin::CarouselsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_carousel, only: %i[show edit update destroy]

  def index
    @pagy, @carousels = pagy(Carousel.all.includes([image_attachment: :blob]).order(created_at: :desc))
  end

  def show; end

  def new
    @carousel = Carousel.new
  end

  def edit; end

  def create
    @carousel = Carousel.new(carousel_params)

    respond_to do |format|
      if @carousel.save
        format.html { redirect_to tat_ca_bang_ron_path, notice: 'Băng rôn đã được tạo thành công.' }
      else
        format.html { redirect_to them_moi_bang_ron_path, alert: "#{@carousel.errors.full_messages.join('\n').html_safe}" }
      end
    end
  end

  def update
    respond_to do |format|
      if @carousel.update(carousel_params)
        format.html { redirect_to tat_ca_bang_ron_path, notice: 'Băng rôn đã được cập nhật.' }
      else
        format.html { redirect_to cap_nhat_bang_ron_path, alert: "#{@carousel.errors.full_messages.join('\n').html_safe}" }
      end
    end
  end

  def destroy
    @carousel.destroy
    respond_to do |format|
      format.html { redirect_to tat_ca_bang_ron_path, notice: 'Băng rôn đã được xoá.' }
    end
  end

  private
  def set_carousel
    @carousel = Carousel.find(params[:id])
  end

  def carousel_params
    params.require(:carousel).permit(:status, :image)
  end
end
