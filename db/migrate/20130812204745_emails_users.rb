class EmailsUsers < ActiveRecord::Migration
  def change
    create_table :emails_users do |t|
      t.integer  "email_id"
      t.integer  "user_id"
      t.timestamps
    end
  end
end
