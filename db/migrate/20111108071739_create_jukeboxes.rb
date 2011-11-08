class CreateJukeboxes < ActiveRecord::Migration
  def self.up
    create_table :jukeboxes do |t|
      t.string :name
      t.string :url
      t.integer :dashboard_id

      t.timestamps
    end
  end

  def self.down
    drop_table :jukeboxes
  end
end
