class RemoveUserFromPseudonyms < ActiveRecord::Migration[5.1]
  def change
    remove_column :pseudonyms, :user_id
  end
end
