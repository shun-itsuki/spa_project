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
    # binding.pry
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    @places = Article.all.near([latitude,longitude],3,units: :km)
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      # marker.json
      # path = render_to_string(partial: "users/search/infowindow", locals: { place: place})
      # p path
      marker.infowindow "<a href=#{users_article_path(place.id)}>show</a>"
      # render_to_string(partial: "users/search/infowindow", locals: { place: place}).chomp.gsub("\"","'")
      # '<a href="/users/articles/20">広尾湯</a>'
      # render_to_string(partial: "users/search/infowindow", locals: { place: place}).chomp
      # "<a href='#'>test</a>"
      # render_to_string(partial: "users/search/infowindow", locals: { place: place })
    end
    respond_to do |format|
      format.json {render :json => @hash.to_json}
    end
  end

end
