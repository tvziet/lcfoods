class Admin::RegulationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_regulation, only: %i[show edit update destroy]

  def index
    @regulations = Regulation.all
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
        format.html { redirect_to admin_regulations_url, notice: 'Quy định, quy trình đã được tạo thành công.' }
        format.json { render :show, status: :created, location: @regulation }
      else
        format.html { render :new }
        format.json { render json: @regulation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @regulation.update(regulation_params)
        format.html { redirect_to admin_regulations_url, notice: 'Quy định, quy trình đã được cập nhật thành công.' }
        format.json { render :show, status: :ok, location: @regulation }
      else
        format.html { render :edit }
        format.json { render json: @regulation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @regulation.destroy
    respond_to do |format|
      format.html { redirect_to admin_regulations_url, notice: 'Quy định, quy trình đã được xoá thành công.' }
      format.json { head :no_content }
    end
  end

  private
  def set_regulation
    @regulation = Regulation.find(params[:id])
  end

  def regulation_params
    params.require(:regulation).permit(:title, :body, :status, :company_id, :category_id, attachments: [])
  end
end
