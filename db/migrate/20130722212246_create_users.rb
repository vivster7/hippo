class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
			t.string :first_name
      t.string :name
      t.string :email
      
      t.timestamps
    end
  end
end
