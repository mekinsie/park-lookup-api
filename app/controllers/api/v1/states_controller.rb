class Api::V1::StatesController < ApplicationController

  def index
    @states = State.all
    json_response(@states)
  end

  def show
    @state = State.find(params[:id])
    json_response(@state)
  end

  def create
    if @state = State.create!(state_params)
      render status: 201, json: {
        message: "You have successfully created a state.",
        state: @state
      }
    end
  end

  def update
    @state = State.find(params[:id])
    if @state.update!(state_params)
      render status: 200, json: {
        message: "This state has been successfully updated.",
        state: @state
      }
    else
      render json: { error: @state.errors.messages }, status: 422
    end
  end

  def destroy
    @state = State.find(params[:id])
    if @state.destroy!
      render status: 200, json: {
        message: "You have successfully deleted the state with id #{@state.id}."
      }
    end
  end

  private
  def state_params
    params.permit(:name, :state_type, :state_id)
  end

end