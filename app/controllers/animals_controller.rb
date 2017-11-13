class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      flash[:notice] = "Animal has been saved!"
      redirect_to animals_path
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      flash[:notice] = "Your animal has been updated!"
      redirect_to animals_path
    else
      render :edit
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_path
  end

private
  def animal_params
    params.require(:animal).permit(:species)
  end
end
