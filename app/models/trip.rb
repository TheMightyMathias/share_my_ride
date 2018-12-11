class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :airport
  has_many :ridemates, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :trip_users, through: :ridemates, source: :user, dependent: :destroy
  validates :destination, presence: true

  geocoded_by :destination
  after_validation :geocode, if: :will_save_change_to_destination?


end
