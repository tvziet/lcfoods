class DocumentsController < ApplicationController
  def index
    @page_documents = Document.all.order(created_at: :desc)
    if params["search"]
      @pagy, @page_documents = pagy(@page_documents.where('lower(title) LIKE ?', "%#{params["search"]}%"))
    else
      @pagy, @page_documents = pagy(@page_documents)
    end
  end

  def show
    @page_document = Document.find(params[:id])
  end
end