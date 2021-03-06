class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :races, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :photos, dependent: :destroy



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
