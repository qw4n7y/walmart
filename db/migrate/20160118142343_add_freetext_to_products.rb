class AddFreetextToProducts < ActiveRecord::Migration
  def change
    add_column :products, :freetext, :string
  end
end
