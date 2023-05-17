class Room < ApplicationRecord
  belongs_to :user
  has_many :room_items
  has_many :items, through: :room_items

end
