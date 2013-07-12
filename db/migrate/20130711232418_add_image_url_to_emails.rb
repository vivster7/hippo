class AddImageUrlToEmails < ActiveRecord::Migration
  def change
  	add_column :emails, :image_url, :string
  end
end
