class Ridemate < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  validates_uniqueness_of :user_id, scope: :trip_id
  after_create :send_trip_confirm

  private
  def send_trip_confirm
    UserMailer.tripconfirm(self).deliver_now
  end
end
