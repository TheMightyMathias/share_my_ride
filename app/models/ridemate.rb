class Ridemate < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  validates_uniqueness_of :user_id, scope: :trip_id
end
