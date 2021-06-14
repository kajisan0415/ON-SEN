class AddLatitudeToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :latitude, :float
  end
end
