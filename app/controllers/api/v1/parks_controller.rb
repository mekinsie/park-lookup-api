class Api::V1::ParksController < ApplicationController

  def index
    state = State.find(params[:state_id])
    @parks = state.parks
    json_response(@parks)
  end

  def show
    @state = State.find(params[:state_id])
    @park = Park.find(params[:id])
    if @park.state_id == @state.id
      json_response(@park)
    else
      render status: 404, json: {
        message: "The park with id #{@park.id} (#{@park.name}) is not in the state with id #{@state.id} (#{@state.name})"
      }
    end
  end

  def create
    if @park = Park.create!(park_params)
      render status: 201, json: {
        message: "You have successfully created a park.",
        park: @park
      }
    end
  end

  def update
    @state = State.find(params[:state_id])
    @park = Park.find(params[:id])
    if @park.state_id != @state.id
      render status: 404, json: {
        message: "The park with id #{@park.id} (#{@park.name}) is not in the state with id #{@state.id} (#{@state.name})"
      }
    elsif @park.update!(park_params)
      render status: 200, json: {
        message: "This park has been successfully updated.",
        park: @park
      }
    else
      render json: { error: @park.errors.messages }, status: 422
    end
  end

  def destroy
    @state = State.find(params[:state_id])
    @park = Park.find(params[:id])
    if @park.state_id != @state.id
      render status: 404, json: {
        message: "The park with id #{@park.id} (#{@park.name}) is not in the state with id #{@state.id} (#{@state.name})"
      }
    elsif @park.destroy!
      render status: 200, json: {
        message: "You have successfully deleted the park with id #{@park.id}."
      }
    end
  end

  private
  def park_params
    params.permit(:name, :park_type, :state_id)
  end
end