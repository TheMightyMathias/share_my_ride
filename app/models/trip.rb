class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :airport
  has_many :ridemates, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :trip_users, through: :ridemates, source: :user, dependent: :destroy
  has_many :reviews
  validates :destination, presence: true
  validate :estimate_not_nil

  geocoded_by :destination
  after_validation :geocode, if: :will_save_change_to_destination?
  after_update :send_trip_update, if: :saved_change_to_ridemates?

private
  def send_trip_update
    UserMailer.ridemateconfirm(self).deliver_now
  end

  def estimate_not_nil
    if estimate.nil?
      errors.add(:estimate, "Please put in a estimate - Uber could not calculate for you or the value you provided was invalid.")
    end
  end
end
