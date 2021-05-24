class Campaign < ApplicationRecord
    belongs_to :user
    has_many :users
    has_many :donations
    has_many :donations, through: :users
end
