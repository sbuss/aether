class Jukebox < ActiveRecord::Base
  has_many :songs
  belongs_to :dashboard

  validates :name,  :presence   => true,
                    :length     => { :maximum => 50 }
  validates :dashboard_id, :presence => true
end
