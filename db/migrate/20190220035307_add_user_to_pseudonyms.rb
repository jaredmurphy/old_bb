class AddUserToPseudonyms < ActiveRecord::Migration[5.1]
  def change
    add_reference :pseudonyms, :user, foreign_key: true, index: true
  end
end
