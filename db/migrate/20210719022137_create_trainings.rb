class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.string :name, null: false
      t.datetime :date
      t.integer :sport, default: 0
      t.integer :level, default: 0
      t.boolean :active, default: false
      t.references :user, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
