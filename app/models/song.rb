class Song < ActiveRecord::Base
  has_many :votes

  validates :name,  :presence   => true,
                    :length     => { :maximum => 50 }
  validates :grooveshark_song_id,  :presence   => true

  acts_as_url :name
  def to_param
    url
  end
end
