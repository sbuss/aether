class Song < ActiveRecord::Base
  has_many :votes
  has_many :users, :through => :votes
  belongs_to :jukebox

  validates :name,  :presence   => true,
                    :length     => { :maximum => 50 }
  validates :grooveshark_song_id,  :presence   => true

  acts_as_url :name
  def to_param
    url
  end
end
