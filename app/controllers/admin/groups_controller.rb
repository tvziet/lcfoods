class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_group, only: %i[show edit update destroy]
  before_action :check_admin, except: %i[index show]

  def index
    @groups = Group.all
  end

  def show; end

  def new
    @group = Group.new
  end

  def edit; end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to admin_groups_url, notice: 'Phòng ban đã được tạo thành công.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to admin_groups_url, notice: 'Phòng ban đã được cập nhật thành công.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to admin_groups_url, notice: 'Phòng ban đã được xoá thành công.' }
      format.json { head :no_content }
    end
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :company_id)
  end

  def check_admin
    return if current_admin.is_super_admin == false && @group.company_id != current_admin&.company_id
  end
end
