class Item < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :room_items
  has_many :rooms, through: :room_items
  has_many :warranty_cards
end
