class CreateCategoriesProjectsJoinTable < ActiveRecord::Migration
  def self.up
    create_table 'categories_projects', :id => false do |t|
      t.column 'category_id', :integer
      t.column 'project_id', :integer
    end
  end
  def self.down
    drop_table 'category_projects'
  end
end
