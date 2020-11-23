class RegulationsController < ApplicationController
  def index
    @pagy, @page_regulations = pagy(Regulation.all.order(created_at: :desc))
  end

  def show
    @page_regulation = Regulation.find(params[:id])
  end
end