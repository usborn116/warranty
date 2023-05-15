class CreateWarrantyCards < ActiveRecord::Migration[7.0]
  def change
    create_table :warranty_cards do |t|
      t.references :item, null: false, foreign_key: true
      t.string :code
      t.string :contact
      t.date :expiration
      t.boolean :lifetime
      t.text :notes

      t.timestamps
    end
  end
end
