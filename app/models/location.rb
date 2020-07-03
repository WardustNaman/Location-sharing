class Location < ApplicationRecord
	validates :x_axis, presence: true
    validates :y_axis, presence: true

	has_many :users_locations
    has_many :users, through: :users_locations
end
