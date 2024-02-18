class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :workout_tag_id, null: false
      t.integer :prefecture_id, null: false
      t.string :titlename, null: false
      t.string :postcontent, null: false

      t.timestamps
    end
  end
end
