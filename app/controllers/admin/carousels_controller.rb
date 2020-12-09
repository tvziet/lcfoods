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
        format.json { render :show, status: :created, location: @carousel }
      else
        format.html { render :new }
        format.json { render json: @carousel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @carousel.update(carousel_params)
        format.html { redirect_to tat_ca_bang_ron_path, notice: 'Băng rôn đã được cập nhật.' }
        format.json { render :show, status: :ok, location: @carousel }
      else
        format.html { render :edit }
        format.json { render json: @carousel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @carousel.destroy
    respond_to do |format|
      format.html { redirect_to tat_ca_bang_ron_path, notice: 'Băng rôn đã được xoá.' }
      format.json { head :no_content }
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
