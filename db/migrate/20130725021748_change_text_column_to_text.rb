class ChangeTextColumnToText < ActiveRecord::Migration
  def up
    change_column :emails, :text, :text
  end
  def down
    # This might cause trouble if you have strings longer
    # than 255 characters.
    change_column :emails, :text, :string
  end
end
