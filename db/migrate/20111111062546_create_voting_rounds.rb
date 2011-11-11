class CreateVotingRounds < ActiveRecord::Migration
  def self.up
    create_table :voting_rounds do |t|
      t.integer :winning_song_id
      t.integer :jukebox_id
      t.integer :song_id_1
      t.integer :song_id_2
      t.integer :song_id_3

      t.timestamps
    end
  end

  def self.down
    drop_table :voting_rounds
  end
end
