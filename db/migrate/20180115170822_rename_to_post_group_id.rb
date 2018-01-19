class RenameToPostGroupId < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :groupo_id , :group_id    
  end
end
