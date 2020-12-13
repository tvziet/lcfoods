class DocumentsController < ApplicationController
  def index
    @pagy, @page_documents = pagy(Document.all.order(created_at: :desc))
  end

  def show
    @page_document = Document.friendly.find(params["id"])
  end

  def group_documents
    @page_group             = Group.friendly.find(params["id"])
    @pagy, @group_documents = pagy(Document.where(group_id: @page_group&.id).order(created_at: :desc))
  end
end