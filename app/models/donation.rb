class Donation < ApplicationRecord
  belongs_to :campaign
  #belongs_to :user

  validates :price, presence: true
  validates :comment, presence: true
end
