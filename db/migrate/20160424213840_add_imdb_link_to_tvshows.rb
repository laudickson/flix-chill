class AddImdbLinkToTvshows < ActiveRecord::Migration
  def up
    add_column :tvshows, :imdblink, :string
  end

  def down
    remove_column :tvshows, :imdblink
  end
end
