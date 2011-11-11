class AddNowPlayingToJukebox < ActiveRecord::Migration
  def self.up
    add_column :jukeboxes, :now_playing, :integer
  end

  def self.down
    remove_column :jukeboxes, :now_playing
  end
end
