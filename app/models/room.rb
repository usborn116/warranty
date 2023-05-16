class Room < ApplicationRecord
  belongs_to :user
  has_many :room_items, inverse_of: :room
  has_many :items, through: :room_items

end
