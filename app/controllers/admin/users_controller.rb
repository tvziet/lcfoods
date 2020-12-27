class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: %i[show edit update destroy]

  def index
    # @pagy, @users = pagy(User.all.includes([avatar_attachment: :blob]).includes(:group).order(created_at: :desc))
    @pagy, @users = pagy(User.all.includes(:group).order(created_at: :desc))
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to nhan_vien_path, notice: 'Nhân viên đã được tạo thành công.' }
      else
        # format.html { redirect_to them_moi_nhan_vien_path, alert: "#{@user.errors.full_messages.join('\n').html_safe}" }
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to nhan_vien_path, notice: 'Nhân viên đã được cập nhật thành công.' }
      else
        # format.html { redirect_to cap_nhat_nhan_vien_path(@user), alert: "#{@user.errors.full_messages.join('\n').html_safe}" }
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to nhan_vien_path, notice: 'Nhân viên đã được xoá thành công.' }
    end
  end

  private
  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :birthday,
                                 :cell_phone,
                                 :address,
                                 :bio,
                                 :avatar,
                                 :email,
                                 :group_id,
                                 :employee_number)
  end
end
