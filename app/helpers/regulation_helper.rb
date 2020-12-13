module RegulationHelper
  def five_notable_regulations
    all_notable_regulations  = Regulation.notable.order(created_at: :desc)
    five_notable_regulations = all_notable_regulations.limit(5) if all_notable_regulations.any?
  end
end