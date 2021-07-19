class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :country
      t.string :city
      t.string :location, null: false
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
