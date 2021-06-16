class AddLongitudeToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :longitude, :float
  end
end
