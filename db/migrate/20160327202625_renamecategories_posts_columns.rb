class RenamecategoriesPostsColumns < ActiveRecord::Migration
  def self.up
     rename_column :categories_posts, :project_id, :post_id
   end

   def self.down
     # rename back if you need or do something else or do nothing
   end
end
