class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :reviews
      t.string :identifier
      t.timestamps
    end
    add_reference :reviews, :user, foreign_key: true
  end
end
