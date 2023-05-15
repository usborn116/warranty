class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :brand
      t.date :year
      t.string :serial

      t.timestamps
    end
  end
end
