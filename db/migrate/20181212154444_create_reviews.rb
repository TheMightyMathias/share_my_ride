class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :rating
      t.integer :reviewer_id
      t.integer :reviewed_id
      t.references :trip, foreign_key: true
      t.timestamps
    end
  end
end
