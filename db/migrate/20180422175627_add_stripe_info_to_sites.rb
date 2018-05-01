class AddStripeInfoToSites < ActiveRecord::Migration[5.0]
  def change
  	add_column :sites, :stripe_info, :string
  end
end
