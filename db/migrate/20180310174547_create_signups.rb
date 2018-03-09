class CreateSignups < ActiveRecord::Migration[5.0]
  def change
    create_table :signups do |t|
      t.string :name
      t.string :url
      t.string :email	
      t.timestamps
    end
  end
end
