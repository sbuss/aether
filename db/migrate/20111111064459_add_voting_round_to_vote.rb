class AddVotingRoundToVote < ActiveRecord::Migration
  def self.up
    add_column :votes, :voting_round_id, :integer
  end

  def self.down
    remove_column :votes, :voting_round_id
  end
end
