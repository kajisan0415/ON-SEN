class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :article_id
      t.integer :image_id
      t.string :title
      t.float :rate

      t.timestamps
    end
  end
end
