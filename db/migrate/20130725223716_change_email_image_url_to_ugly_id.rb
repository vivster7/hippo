class ChangeEmailImageUrlToUglyId < ActiveRecord::Migration
  def change
    rename_column( :emails, :image_url, :ugly_image_id)    
  end
end
