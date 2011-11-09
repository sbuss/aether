class AddArtistToSong < ActiveRecord::Migration
  def self.up
    add_column :songs, :artist, :string
  end

  def self.down
    remove_column :songs, :artist
  end
end
