class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :fullname, null: false
      t.string :adress
      t.string :phone
      t.string :social_media
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
