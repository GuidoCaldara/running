class RacesController < ApplicationController
 before_action :find_race, only:[:edit, :show, :update, :destroy]

  def index
    @races = Race.all
    @races = @races.filter_by_race_type(params["race_type"]) if params["race_type"].present?
    @races = @races.filter_by_distance_type(params["distance_type"]) if params["distance_type"].present?
    @races = @races.filter_by_first_date(params["dates_range"]) if params["dates_range"].present?
    @races = @races.filter_by_last_date(params["dates_range"]) if params["dates_range"].present? && params["dates_range"].split[2]
    @races = @races.near(params["location"], 50) if params["location"].present?
    @races = @races.order(next_edition_date: :asc).limit(50)

    @markers = @races.map do |race|
  {
    lng: race.longitude,
    lat: race.latitude,
    name: race.name,
    date: race.next_edition_date,
    id: race.id,
    type: race.race_type.capitalize,
    distance_km: race.distance_km
  }
end

  end


  def show
    @review = Review.new
    @race = Race.find(params[:id])
    @reviews = @race.reviews
    @markers = { lat: @race.latitude, lng: @race.longitude } if @race.latitude
    @photos = @race.photos.reverse
    @photos_urls = @race.photo_urls
    @questions = @race.questions
  end

  def new
    @race = Race.new
  end

  def create
    @race = Race.new(race_params)
    @race.user = current_user
    byebug
    if @race.save
      redirect_to @race
    else
      render "new"
    end
  end


  def edit
  end

  def update
    if @race.update(race_params)
      redirect_to @race
    else
      render "new"
    end
  end



  def find_race
    Race.find(params[:id])
  end

  def race_params
    params.require(:race).permit(:name, :description, :race_type, :distance_km, :elevation, :website, :subscription_link, :next_edition_date, :elevation, :location, :third_price, :website, :subscription_link, :first_price, :second_price, :third_price, :first_price_start, :first_price_end, :second_price_start, :second_price_end, :first_edition, :instagram_page, :facebook_page, :video, :subscription_start, :subscription_end, :goodies)
  end

end
