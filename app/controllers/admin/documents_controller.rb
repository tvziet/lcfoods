class Admin::DocumentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_document, only: %i[show edit update destroy]

  def index
    @documents = Document.all
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
        format.html { redirect_to admin_documents_url, notice: 'Biểu mẫu đã được tạo thành công.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to admin_documents_url, notice: 'Biểu mẫu đã được cập nhật thành công.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to admin_documents_url, notice: 'Biểu mẫu đã được xoá thành công.' }
      format.json { head :no_content }
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
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:title, :attachment)
  end
end
