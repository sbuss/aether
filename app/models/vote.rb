class Vote < ActiveRecord::Base
  belongs_to :songs
  belongs_to :users
  belongs_to :voting_round

  validates_presence_of :song_id
  validates_presence_of :user_id
  validates_presence_of :voting_round_id
end
