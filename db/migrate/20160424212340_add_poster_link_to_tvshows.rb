class AddPosterLinkToTvshows < ActiveRecord::Migration
  def up
    add_column :tvshows, :posterlink, :string
  end

  def down
    remove_column :tvshows, :posterlink
  end
end
