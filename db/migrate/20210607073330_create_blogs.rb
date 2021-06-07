class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.text :body
      t.integer :user_id
      t.string :image_id
      t.string :title
      t.text :memo

      t.timestamps
    end
  end
end
