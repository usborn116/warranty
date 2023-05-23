class Item < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :room_items, dependent: :destroy
  has_many :rooms, through: :room_items
  has_many :warranty_cards, dependent: :destroy

  accepts_nested_attributes_for :warranty_cards, allow_destroy: true
  accepts_nested_attributes_for :room_items, allow_destroy: true

  validates_presence_of :name, :brand, :year, :serial
  include Filterable

  scope :filter_by_name, ->(name) { joins(:rooms).where("LOWER(items.name) like ?", "#{name.downcase}%").distinct }
  scope :filter_by_room, ->(room) { joins(:rooms).where('LOWER(rooms.name) = ?', "#{room.downcase}" ).distinct }
  scope :filter_by_expired, ->(_expired) { joins(:warranty_cards).where('warranty_cards.expiration < ?', "#{Date.today}").distinct }
  scope :filter_by_active, ->(_active) { joins(:warranty_cards).where('warranty_cards.expiration >= ?', "#{Date.today}" ).or(joins(:warranty_cards).where('warranty_cards.lifetime >= ?', "true")).distinct }

  before_save :find_or_create_rooms

  def find_or_create_rooms
    self.room_items.each do |room_item|
      room_item.room = Room.find_or_create_by(name: room_item.room.name, user_id: room_item.room.user_id)
    end
  end
end
