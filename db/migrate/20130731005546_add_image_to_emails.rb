class AddImageToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :image, :string
  end
end
