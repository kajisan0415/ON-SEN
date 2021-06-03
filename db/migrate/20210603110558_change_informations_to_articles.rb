class ChangeInformationsToArticles < ActiveRecord::Migration[5.2]
  def change
    rename_table :informaitions, :articles
  end
end
