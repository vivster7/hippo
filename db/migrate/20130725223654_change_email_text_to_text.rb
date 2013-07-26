class ChangeEmailTextToText < ActiveRecord::Migration
  def up
      change_column :emails, :text, :text
  end
  def down
      change_column :emails, :text, :string
  end
end
