class CreateRoomItems < ActiveRecord::Migration[7.0]
  def change
    create_table :room_items do |t|
      t.references :room, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
