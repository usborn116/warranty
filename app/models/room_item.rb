class RoomItem < ApplicationRecord
  belongs_to :room
  belongs_to :item
  accepts_nested_attributes_for :room
  
  before_create :find_or_create_room

  private

  def find_or_create_room
    self.room = Room.find_or_create_by(name: room.name)
  end

end
