class Song < ActiveRecord::Base
  has_many :votes
  has_many :users, :through => :votes
  belongs_to :jukebox

  validates :name,  :presence   => true,
                    :length     => { :maximum => 500 }
  validates :artist,  :presence   => true,
                    :length     => { :maximum => 100 }
  validates :grooveshark_song_id,  :presence   => true

  acts_as_url :name
  def to_param
    url
  end

  def as_json(options = {})
    {
      :id => self.id,
      :name => self.name,
      :grooveshark_song_id => self.grooveshark_song_id,
      :votes => self.votes.map { |o| o.id }
    }
  end
end
