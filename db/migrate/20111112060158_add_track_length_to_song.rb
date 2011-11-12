class AddTrackLengthToSong < ActiveRecord::Migration
  def self.up
    add_column :songs, :length, :integer
  end

  def self.down
    remove_column :songs, :length
  end
end
