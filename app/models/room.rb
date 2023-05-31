class Room < ApplicationRecord
  belongs_to :user
  has_many :room_items
  has_many :items, through: :room_items

  validates_presence_of :name

  include Filterable

  scope :filter_by_name, ->(name) { joins(:items).where("LOWER(rooms.name) like ?", "#{name.downcase}%").distinct }

end
