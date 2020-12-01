class RegulationsController < ApplicationController
  def index
    @pagy, @page_regulations = pagy(Regulation.all.order(created_at: :desc))
  end

  def show
    @page_regulation = Regulation.find(params[:id])
  end

  def company_regulations
    @page_company        = Company.find_by(id: params[:id])
    @company_regulations = Regulation.where(company_id: @page_company&.id).order(created_at: :desc)
    if params["search"]
      @pagy, @search_regulations = pagy(@company_regulations.where('lower(title) LIKE ?', "%#{params["search"]}%"))
    else
      @pagy, @search_regulations = pagy(@company_regulations)
    end

  end
end