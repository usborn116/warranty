class Item < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :room_items, inverse_of: :item
  has_many :rooms, through: :room_items
  has_many :warranty_cards

  accepts_nested_attributes_for :warranty_cards, allow_destroy: true
  accepts_nested_attributes_for :room_items

  validates_presence_of :name, :brand, :year, :serial
end
