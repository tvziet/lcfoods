class HomeController < ApplicationController
  include Searchable
  def index; end

  def search
    @array_of_result_objects = Searchable.filter(params["search"]) if params["search"]
  end
end
