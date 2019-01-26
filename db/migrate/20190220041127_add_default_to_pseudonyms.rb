class AddDefaultToPseudonyms < ActiveRecord::Migration[5.1]
  def change
    add_column :pseudonyms, :default, :boolean, default: false
  end
end
