class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.text :title
      t.text :message

      t.timestamps null: false
    end
    add_index :reviews, :product_id
  end
end
