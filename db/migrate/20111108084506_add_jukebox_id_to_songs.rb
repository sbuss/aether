class AddJukeboxIdToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :jukebox_id, :integer
  end

  def self.down
    remove_column :songs, :jukebox_id
  end
end
