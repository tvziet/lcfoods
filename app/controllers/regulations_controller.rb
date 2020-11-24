class RegulationsController < ApplicationController
  def index
    @pagy, @page_regulations = pagy(Regulation.all.order(created_at: :desc))
  end

  def show
    @page_regulation = Regulation.find(params[:id])
  end

  def company_regulations
    @page_company               = Company.find_by(id: params[:id])
    @pagy, @company_regulations = pagy(Regulation.where(company_id: @page_company&.id))
  end
end