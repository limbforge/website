class RenamePoststoProjects < ActiveRecord::Migration
  def change
    rename_table :posts, :projects
  end
end
