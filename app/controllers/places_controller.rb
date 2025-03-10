class PlacesController < ApplicationController
  def index
    @places = if params[:search]
                Place.where('name LIKE ?', "%#{params[:search]}%")
              else
                Place.all
              end
  end

  def show
    @place = Place.find(params[:id])
  end
end
