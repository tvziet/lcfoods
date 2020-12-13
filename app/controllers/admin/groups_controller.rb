class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @pagy, @groups = pagy(Group.all.order(created_at: :desc))
  end

  def show
    @pagy, @users_of_group       = pagy(User.includes([:group]).where(group_id: @group.id).order(created_at: :desc))
    @pagy, @regulations_of_group = pagy(Regulation.includes([:group, :category]).where(group_id: @group.id).order(created_at: :desc))
  end

  def new
    @group = Group.new
  end

  def edit; end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to tat_ca_phong_ban_path, notice: 'Phòng ban đã được tạo thành công.' }
      else
        format.html { redirect_to them_moi_phong_ban_path, alert: "#{@group.errors.full_messages.join('\n').html_safe}" }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to tat_ca_phong_ban_path, notice: 'Phòng ban đã được cập nhật thành công.' }
      else
        format.html { redirect_to cap_nhat_phong_ban_path(@group), alert: "#{@group.errors.full_messages.join('\n').html_safe}" }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to tat_ca_phong_ban_path, notice: 'Phòng ban đã được xoá thành công.' }
    end
  end

  private
  def set_group
    @group = Group.friendly.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
