class Api::V1::ParksController < ApplicationController

  def index
    @parks = Parks.all
    json_response(@parks)
  end

end