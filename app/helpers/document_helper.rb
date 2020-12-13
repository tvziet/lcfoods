module DocumentHelper
  def five_documents
    all_documents  = Document.all.order(created_at: :desc)
    five_documents = all_documents.limit(5) if all_documents.any?
  end
end