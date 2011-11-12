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

  def num_winning_votes
    Vote.where("voting_round_id = ? AND song_id = ?", self.id, self.winning_song_id).count
  end

  def format_time
    self.updated_at.strftime("%b %d at %H:%M")
  end
end
