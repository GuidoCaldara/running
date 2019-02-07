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


  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :race_type, presence: true, inclusion: { in: %w(trail skyrace vertical)}
  validates :distance_km, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 500 }
  validates :elevation, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 30000 }
  validates :location, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 30, maximum: 50 }
  validates :website, presence: true, length: { minimum: 6, maximum: 50 }, :if => lambda {|attr| attr.present?}

  validates :first_price, numericality: { only_integer: true, greater_than: 0, less_than: 500 },  :if => lambda {|attr| attr.present?}
  validates :second_price, numericality: { only_integer: true, greater_than: 0, less_than: 500 },  :if => lambda {|attr| attr.present?}
  validates :third_price, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 500 }, :if => lambda {|attr| attr.present?}
  validate :goodies, length: { minimum: 6, maximum: 50 }, :if => lambda {|attr| attr.present?}

  validates :next_edition_date, presence: true
  validates :subscription_start, :subscription_end, presence: true
  validates :location, length: { minimum: 3, maximum: 50 }
  validates :elevation, numericality: { only_integer: true, greater_than: 0, less_than: 30000 }
  validate :has_lat_lng, on: :save

  t.date "first_edition"
  t.date "first_price_start"
  t.date "first_price_end"
  t.date "second_price_start"
  t.date "second_price_end"
  t.date "third_price_start"
  t.date "third_price_end"
  t.text "goodies"


  scope :filter_by_race_type, -> (array) { where(race_type: array) }
  scope :filter_by_distance_type, -> (array) { where(distance_type: array) }
  scope :filter_by_first_date, -> (date) { where("next_edition_date > ?",  Date.parse((date).split[0])) }
  scope :filter_by_last_date, -> (date) { where("next_edition_date < ?",  Date.parse((date).split[2])) }
  self.per_page = 20


  def has_lat_lng
    self.latitude && self.lngitude
  end
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
    if (self.next_edition_date.month >= 12 || self.next_edition_date.month <=2)
      self.season = "winter"
    elsif (self.next_edition_date.month >= 3 || self.next_edition_date.month <= 5)
      self.season = "spring"
    elsif (self.next_edition_date.month >= 6 || self.next_edition_date.month <= 8)
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


  # RACE_TYPES = [
  #   {
  #     params: 'race_type[]',
  #     value: 'trail',
  #     label: 'Trail'
  #   },
  #   {
  #     params: 'race_type[]',
  #     value: 'skyrace',
  #     label: 'Skyrace'
  #   },
  #   {
  #     params: 'race_type[]',
  #     value: 'road',
  #     label: 'Strada'
  #   },
  #   {
  #     params: 'race_type[]',
  #     value: 'vertical',
  #     label: 'Vertical'
  #   },
  # ]
  #
  #
  # DISTANCE_TYPES = [
  #   {
  #     params: 'distance_type[]',
  #     value: 'short',
  #     label: '1-21Km'
  #   },
  #   {
  #     params: 'distance_type[]',
  #     value: 'medium',
  #     label: '22-42Km'
  #   },
  #   {
  #     params: 'distance_type[]',
  #     value: 'long',
  #     label: '43-100Km'
  #   },
  #   {
  #     params: 'distance_type[]',
  #     value: 'ultra',
  #     label: ' > 100 km '
  #   }
  # ].freeze

end
