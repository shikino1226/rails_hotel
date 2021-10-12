class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :introduction
      t.integer :price
      t.string :address

      t.timestamps
    end
  end
end
