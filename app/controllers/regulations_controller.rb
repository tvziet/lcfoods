class RegulationsController < ApplicationController
  before_action :set_page_regulation, only: %i[show]
  def index
    @page_regulations        = Regulation.all.order(created_at: :desc)
    @pagy, @page_regulations = pagy(@page_regulations)
  end

  def show; end

  def category_regulations
    @page_category                = Category.friendly.find(params["id"])
    @pagy, @category_regulations  = pagy(Regulation.where(category_id: @page_category&.id).order(created_at: :desc))
  end

  private
  def set_page_regulation
    @page_regulation = Regulation.friendly.find(params["id"])
  end
end