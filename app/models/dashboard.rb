class Dashboard < ActiveRecord::Base
  belongs_to :user

  validates :name,  :presence   => true,
                    :length     => { :maximum => 50 }
  validates :user_id, :presence => true

  acts_as_url :name
  def to_param
    url
  end
end
