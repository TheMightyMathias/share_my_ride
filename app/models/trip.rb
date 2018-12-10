class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :airport
  has_many :ridemates
  has_many :messages
  validates :destination, presence: true

  geocoded_by :destination
  after_validation :geocode, if: :will_save_change_to_destination?
end
