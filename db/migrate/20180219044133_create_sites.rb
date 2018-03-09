class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|      
      t.string :business
      t.string :address
      t.string :sites
      t.string :plan
      t.timestamps
      add_reference :users, :user_id, index: true, foreign_key: true
    end
  end
end
