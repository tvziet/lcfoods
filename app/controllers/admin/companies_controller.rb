class Admin::CompaniesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_company, only: %i[show edit update destroy]
  # before_action :check_admin, except: %i[index show]

  def index
    @companies = Company.all
  end

  def show; end

  def new
    @company = Company.new
  end

  def edit; end

  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to tat_ca_cong_ty_path, notice: 'Công ty đã được tạo thành công.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to tat_ca_cong_ty_path, notice: 'Công ty đã được cập nhật thành công.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to tat_ca_cong_ty_path, notice: 'Công ty đã được xoá thành công.' }
      format.json { head :no_content }
    end
  end

  private
  def set_company
    @company = Company.friendly.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name)
  end

  def check_admin
    return unless current_admin.is_super_admin?
  end
end
