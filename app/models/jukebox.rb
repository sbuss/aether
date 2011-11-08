class Jukebox < ActiveRecord::Base
  has_many :songs
  belongs_to :dashboard

  validates :name,  :presence   => true,
                    :length     => { :maximum => 50 }
  validates :dashboard_id, :presence => true

  def as_json(options = {})
    {
      :id => self.id,
      :name => self.name,
      :dashboard => self.dashboard_id,
      :songs => self.songs.map { |o| o.id }
    }
  end
end
