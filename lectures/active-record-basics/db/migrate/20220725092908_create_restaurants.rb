class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      # Columns of the table
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end