class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader
  has_many :trips
  has_many :ridemates
  has_many :messages, dependent: :destroy
  has_many :ridemate_trips, through: :ridemates, source: :trip, dependent: :destroy
  has_many :sent_reviews, class_name: "Review", foreign_key: :reviewer_id
  has_many :received_reviews, class_name: "Review", foreign_key: :reviewed_id
end


