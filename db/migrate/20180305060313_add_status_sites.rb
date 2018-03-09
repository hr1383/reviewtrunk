class AddStatusSites < ActiveRecord::Migration[5.0]
  def change
  	add_column :sites, :status, :string
  	add_column :sites, :business_url, :string
  	add_column :sites, :widget1, :string
  	add_column :sites, :url1, :string
  	add_column :sites, :widget2, :string
  	add_column :sites, :url2, :string
  	add_column :sites, :widget3, :string
  	add_column :sites, :url3, :string
  	add_column :sites, :widget4, :string
  	add_column :sites, :url4, :string
  end
end
