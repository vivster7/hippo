class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
    	t.string	"text"
    	t.string	"slug"
      t.timestamps
    end
    add_index :emails, :slug, unique: true
  end
end
