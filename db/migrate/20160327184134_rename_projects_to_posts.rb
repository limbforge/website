class RenameProjectsToPosts < ActiveRecord::Migration
  def change
    rename_table :projects, :posts
  end
end
