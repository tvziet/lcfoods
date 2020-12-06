class RegulationsController < ApplicationController
  def index
    @page_regulations        = Regulation.all.order(created_at: :desc)
    @pagy, @page_regulations = pagy(@page_regulations)
  end

  def show
    @page_regulation = Regulation.friendly.find(params[:id])
  end

  def company_regulations
    @page_company              = Company.find_by(id: params[:id])
    @company_regulations       = Regulation.where(company_id: @page_company&.id).order(created_at: :desc)
    @pagy, @search_regulations = pagy(@company_regulations)
  end
end