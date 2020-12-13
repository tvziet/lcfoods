class Admin::DocumentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_document, only: %i[show edit update destroy]

  def index
    @pagy, @documents = pagy(Document.all.order(created_at: :desc))
  end

  def show; end

  def new
    @document = Document.new
  end

  def edit; end

  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to van_ban_bieu_mau_path, notice: 'Biểu mẫu đã được tạo thành công.' }
      else
        format.html { redirect_to them_moi_van_ban_bieu_mau_path, alert: "#{@document.errors.full_messages.join('\n').html_safe}" }
      end
    end
  end

  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to van_ban_bieu_mau_path, notice: 'Biểu mẫu đã được cập nhật thành công.' }
      else
        format.html { redirect_to cap_nhat_van_ban_bieu_mau_path(@document), alert: "#{@document.errors.full_messages.join('\n').html_safe}" }
      end
    end
  end

  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to van_ban_bieu_mau_path, notice: 'Biểu mẫu đã được xoá thành công.' }
    end
  end

  def search
    if params["search"]
      @pagy, @search_results_documents = pagy(Document.where('lower(title) LIKE ?', "%#{params["search"]}%").order(created_at: :desc))
    else
      @pagy, @search_results_documents = pagy(Document.all.order(created_at: :desc))
    end
  end

  private
  def set_document
    @document = Document.friendly.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:title, :attachment, :group_id)
  end
end
