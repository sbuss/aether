class Smiley < ActiveRecord::Base
  validates_presence_of :user_id
  validates :value, :presence => true,
                    :numericality => { :greater_than_or_equal_to => 0,
                                       :less_than_or_equal_to => 100 }

  def as_json(options) 
    {
      :id => self.id,
      :user_id => self.user_id,
      :value => self.value,
      :created_at => self.created_at
    }
  end

  def self.current_happiness
    latestSmileys = Smiley.find_by_sql("SELECT user_id, value, created_at FROM smileys GROUP BY user_id ORDER BY created_at DESC")
    if latestSmileys.length == 0
      return nil
    end
    latestSmileys.sum(&:value)/latestSmileys.length
  end
end
