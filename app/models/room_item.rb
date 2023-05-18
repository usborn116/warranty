class RoomItem < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :item
  accepts_nested_attributes_for :room

  private

end
