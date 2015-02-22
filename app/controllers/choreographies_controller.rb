class ChoreographiesController < ApplicationController

  before_action :signed_in_user, only: [ :edit, :update]

  def index
    @choreographies = Choreography.order("created_at DESC")
  end

  def show
    @choreography = Choreography.find(params[:id])
    @steps = @choreography.steps
  end

  def new
    @choreography = Choreography.new
  end

  def create
    @choreography = Choreography.new(choreography_params)
    if @choreography.save
      redirect_to choreographies_path, notice: "The article has been successfully created."
    else
      render action: "new"
    end
  end

  def edit
    @choreography = Choreography.find(params[:id])
  end

  def update
    @choreography = Choreography.find(params[:id])
    @choreography.steps.send(:eval)
    if @choreography.update_attributes(choreography_params)
      redirect_to choreographies_path, notice: "The choreograpy has been successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    Choreography.find(params[:id]).destroy
    flash[:success] = "Choreographie gelöscht."
    redirect_to choreographies_url
  end


private

  def choreography_params
    params.require(:choreography).permit(:title, :goal, :steps)
  end
end