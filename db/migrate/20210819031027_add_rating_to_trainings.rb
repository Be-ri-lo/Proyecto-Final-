class AddRatingToTrainings < ActiveRecord::Migration[6.1]
  def change
    add_column :trainings, :rating, :integer
  end
end
