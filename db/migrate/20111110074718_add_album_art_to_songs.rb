class AddAlbumArtToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :album_art, :string
  end

  def self.down
    remove_column :songs, :album_art
  end
end
