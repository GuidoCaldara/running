class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :race
  belongs_to :user
  validates_presence_of :image

end
