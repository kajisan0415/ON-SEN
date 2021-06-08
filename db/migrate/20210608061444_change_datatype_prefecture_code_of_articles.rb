class ChangeDatatypePrefectureCodeOfArticles < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :prefecture_code, :string
  end
end
