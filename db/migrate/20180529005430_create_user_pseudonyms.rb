class CreateUserPseudonyms < ActiveRecord::Migration[5.1]
  def change
    create_table :user_pseudonyms do |t|
      t.references :user, foreign_key: true
      t.references :pseudonym, foreign_key: true

      t.timestamps
    end
  end
end
