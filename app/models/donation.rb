class Donation < ApplicationRecord
  belongs_to :campaign

  validates :price, presence: true 
  validates :price, numericality: { greater_than: 0 }
  validates :comment, presence: true
end
