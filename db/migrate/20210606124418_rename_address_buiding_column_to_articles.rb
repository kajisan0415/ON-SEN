class RenameAddressBuidingColumnToArticles < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :address_buiding, :address_building
  end
end
