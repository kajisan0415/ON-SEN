class AddColumnsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :prefecture_code, :integer
    add_column :articles, :address_city, :string
    add_column :articles, :address_street, :string
    add_column :articles, :address_buiding, :string
    add_column :articles, :site_url, :string
    add_column :articles, :tax, :text
    add_column :articles, :opening_hours, :string
    add_column :articles, :closed, :string
    add_column :articles, :time, :string
    add_column :articles, :introduction, :text
    add_column :articles, :is_valid, :boolean
  end
end
