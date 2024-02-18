class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :post_id, null: false
      t.integer :user_id, null: false
      t.integer :star, null: false
      t.string :commentcontent, null: false
      t.timestamps
      t.index [:post_id, :user_id], unique: true
    end
  end
end
