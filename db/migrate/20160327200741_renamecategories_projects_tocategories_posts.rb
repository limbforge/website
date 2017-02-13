class RenamecategoriesProjectsTocategoriesPosts < ActiveRecord::Migration
  def change
    rename_table :categories_projects, :categories_posts
  end
end
