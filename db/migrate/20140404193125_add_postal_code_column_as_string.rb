class AddPostalCodeColumnAsString < ActiveRecord::Migration
  def change
    add_column :buildings, :postal_code, :string, null: false
  end
end
