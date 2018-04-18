class AllowNillImdbLink < ActiveRecord::Migration[5.1]
  def up
    change_column :directors, :imdb_page, :string, null: true
  end

  def down
    change_column :directors, :imdb_page, :string, null: false
  end
end
