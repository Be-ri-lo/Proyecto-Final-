class CreatePartners < ActiveRecord::Migration[6.1]
  def change
    create_table :partners do |t|
      t.boolean :acepted, default: false
      t.references :user, null: false, foreign_key: true
      t.references :training, null: false, foreign_key: true

      t.timestamps
    end
  end
end
