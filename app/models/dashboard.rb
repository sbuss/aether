class Dashboard < ActiveRecord::Base
  belongs_to :user

  validates :name,  :presence   => true,
                    :length     => { :maximum => 50 }
  validates :user_id, :presence => true

  acts_as_url :name
  def to_param
    url
  end

  def as_json(options = {})
    {
      :id => self.id,
      :name => self.name,
      :user => self.user_id,
    }
  end
end
