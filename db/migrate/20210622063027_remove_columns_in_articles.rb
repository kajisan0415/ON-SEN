class RemoveColumnsInArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :prefecture_code, :string
    remove_column :articles, :address_street, :string
    remove_column :articles, :address_building, :string
    remove_column :articles, :time, :string
    remove_column :articles, :is_valid, :boolean
    remove_column :comments, :image_id, :string
  end
end
