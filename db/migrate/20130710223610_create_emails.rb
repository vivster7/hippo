class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
    	t.text	"text"
    	t.string	"slug"
      t.timestamps
    end
    add_index :emails, :slug, unique: true
  end
end
