class RemoveUserPseudonyms < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_pseudonyms
  end
end
