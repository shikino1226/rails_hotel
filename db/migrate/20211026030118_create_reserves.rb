class CreateReserves < ActiveRecord::Migration[6.0]
  def change
    create_table :reserves do |t|
      t.string :check_in
      t.string :check_out
      t.string :people
      t.integer :total_price
      t.integer :user_id
      t.integer :hotel_id

      t.timestamps
    end
  end
end
