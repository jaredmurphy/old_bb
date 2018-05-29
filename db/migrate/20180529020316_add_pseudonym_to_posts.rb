class AddPseudonymToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :pseudonym, foreign_key: true
  end
end
