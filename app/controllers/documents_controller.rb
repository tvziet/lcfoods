class DocumentsController < ApplicationController
  def index
    @pagy, @page_documents = pagy(Document.all)
  end

  def show
    @page_document = Document.friendly.find(params["id"])
  end

  def group_documents
    @page_group             = Group.friendly.find(params["id"])
    @pagy, @group_documents = pagy(Document.where(group_id: @page_group&.id))
  end
end