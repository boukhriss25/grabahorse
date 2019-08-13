class Horse < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image, presence: true
  mount_uploader :image, PhotoUploader
end

