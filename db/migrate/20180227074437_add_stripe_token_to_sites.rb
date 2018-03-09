class AddStripeTokenToSites < ActiveRecord::Migration[5.0]
  def change
  	add_column :sites, :stripe_token, :string
  	add_column :sites, :ratings, :string  	
  end
end
