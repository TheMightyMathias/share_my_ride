class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :airport
  has_many :ridemates, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :trip_users, through: :ridemates, source: :user, dependent: :destroy
  validates :destination, presence: true

  geocoded_by :destination
  after_validation :geocode, if: :will_save_change_to_destination?
  after_update :send_trip_update, if: :saved_change_to_ridemates?

private
  def send_trip_update
    UserMailer.ridemateconfirm(self).deliver_now
  end
end
