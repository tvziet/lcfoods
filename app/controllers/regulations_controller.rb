class RegulationsController < ApplicationController
  def index
    @page_regulations        = Regulation.all.order(created_at: :desc)
    @pagy, @page_regulations = pagy(@page_regulations)
  end

  def show
    @page_regulation = Regulation.friendly.find(params["id"])
  end

  def group_regulations
    @page_group                = Group.friendly.find(params["id"])
    @pagy, @group_regulations  = pagy(Regulation.where(group_id: @page_group&.id).order(created_at: :desc))
  end
end