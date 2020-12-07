class DocumentsController < ApplicationController
  def index
    @pagy, @page_documents = pagy(Document.all.order(created_at: :desc))
  end

  def show
    @page_document = Document.friendly.find(params["id"])
  end
end