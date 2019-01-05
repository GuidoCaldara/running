class Race < ApplicationRecord
  has_many :reviews
  has_many :questions
  has_many :photos
  has_many :answers
  belongs_to :user
  before_save :set_distance_type
  before_save :set_season
  geocoded_by :location
  before_save :geocode

  scope :filter_by_race_type, -> (array) { where(race_type: array) }
  scope :filter_by_distance_type, -> (array) { where(distance_type: array) }
  scope :filter_by_first_date, -> (date) { where("date > ?",  Date.parse((date).split[0])) }
  scope :filter_by_last_date, -> (date) { where("date < ?",  Date.parse((date).split[2])) }
  self.per_page = 20

  def set_distance_type
    if self.distance_km <= 21
      self.distance_type = "short"
    elsif self.distance_km <= 42
      self.distance_type = "medium"
    elsif self.distance_km <= 100
      self.distance_type = "long"
    else
     self.distance_type = "ultra"
    end
  end

  def set_season
    if (self.date.month >= 12 || self.date.month <=2)
      self.season = "winter"
    elsif (self.date.month >= 3 || self.date.month <= 5)
      self.season = "spring"
    elsif (self.date.month >= 6 || self.date.month <= 8)
      self.distance_type = "spring"
    else
     self.distance_type = "autumn"
    end
  end

  def type_translations
    if self.race_type == "road"
      "Strada"
    elsif self.race_type == "trail"
      "Trail"
    elsif self.race_type == "skyrace"
      "Skyrace"
    else self.race_type == "vertical"
      "VerticalKm"
    end
  end


  def photo_urls
    url_array = []
    self.photos.each do |photo|
      url_array << photo.image.url
    end
    url_array.map! do |url|
      {src: url,w: 1024, h: 768}
    end
    url_array.reverse
  end


  RACE_TYPES = [
    {
      params: 'race_type[]',
      value: 'trail',
      label: 'Trail'
    },
    {
      params: 'race_type[]',
      value: 'skyrace',
      label: 'Skyrace'
    },
    {
      params: 'race_type[]',
      value: 'road',
      label: 'Strada'
    },
    {
      params: 'race_type[]',
      value: 'vertical',
      label: 'Vertical'
    },
  ]


  DISTANCE_TYPES = [
    {
      params: 'distance_type[]',
      value: 'short',
      label: '1-21Km'
    },
    {
      params: 'distance_type[]',
      value: 'medium',
      label: '22-42Km'
    },
    {
      params: 'distance_type[]',
      value: 'long',
      label: '43-100Km'
    },
    {
      params: 'distance_type[]',
      value: 'ultra',
      label: ' > 100 km '
    }
  ].freeze

end
