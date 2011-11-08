class User < ActiveRecord::Base
  has_many :dashboards
  has_many :votes
  has_many :songs, :through => :votes

  validates :name,  :presence   => true,
                    :length     => { :maximum => 50 }

  acts_as_url :name
  def to_param
    url
  end

  def as_json(options = {})
    {
      :id => self.id,
      :name => self.name,
      :dashboards => self.dashboards.map { |o| o.id },
      :votes => self.votes.map { |o| o.id }
    }
  end
end
