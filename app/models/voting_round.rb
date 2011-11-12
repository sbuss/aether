class VotingRound < ActiveRecord::Base
  def as_json(options = {})
    {
      :id => self.id,
      :winning_song_id => self.winning_song_id,
      :song_id_1 => self.song_id_1,
      :song_id_2 => self.song_id_2,
      :song_id_3 => self.song_id_3,
      :jukebox_id => self.jukebox_id,
      :created_at => self.created_at,
      :updated_at => self.updated_at
    }
  end

  def winning_song
    Song.find(self.winning_song_id)
  end
end
