class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewed, class_name: "User"
  belongs_to :trip
  validates :reviewed, uniqueness: { scope: [:trip, :reviewer], message: "You have already reviewed this mate" }
  validates :rating, presence: true, allow_blank: false
end
