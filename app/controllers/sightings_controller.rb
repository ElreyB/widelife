class SightingsController < ApplicationController

  def new
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.new
  end

  def show
    @sighting = Sighting.find(params[:id])
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.new(sighting_params)
    if @sighting.save
      flash[:notice] = "Your sighting has been saved!"
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  def update
    @animal = Animal.find(params[:animal_id])
    @sighting = Sighting.find(params[:id])
    if @sighting.update(sighting_params)
      redirect_to animal_path(@animal)
    else
      render :edit
    end
  end

  def edit
    @animal = Animal.find(params[:animal_id])
    @sighting = Sighting.find(params[:id])
  end

  def destroy
    @animal = Animal.find(params[:animal_id])
    @sighting = Sighting.find(params[:id])
    @sighting.destroy
    redirect_to animal_path(@animal)
  end

private
  def sighting_params
    params.require(:sighting).permit(:date, :latitude, :longitude)
  end

end
