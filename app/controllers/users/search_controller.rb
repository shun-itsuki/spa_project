class Users::SearchController < ApplicationController
  def show
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    @places = Article.all.near([latitude,longitude],10,units: :km)
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
    end
  end

  def search
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    @places = Article.all.near([latitude,longitude],10,units: :km)
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
    end
    respond_to do |format|
      format.json {render :json => @hash.to_json}
  end
  end
end
