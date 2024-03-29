class Jukebox < ActiveRecord::Base
  has_many :songs
  belongs_to :dashboard

  validates :name,  :presence   => true,
                    :length     => { :maximum => 50 }
  validates :dashboard_id, :presence => true

  acts_as_url :name
  def to_param
    url
  end

  def now_playing_song
    if self.now_playing.nil?
      s = Song.first
    else
      s = Song.find(self.now_playing)
    end
    s
  end
  
  def as_json(options = {})
    {
      :id => self.id,
      :name => self.name,
      :dashboard => self.dashboard_id,
      :songs => self.songs.map { |o| o.id },
      :now_playing => self.now_playing
    }
  end
end
