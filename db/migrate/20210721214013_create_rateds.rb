class CreateRateds < ActiveRecord::Migration[6.1]
  def change
    create_table :rateds do |t|
      t.integer :value
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :training, null: false, foreign_key: true

      t.timestamps
    end
  end
end
