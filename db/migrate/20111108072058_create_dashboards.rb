class CreateDashboards < ActiveRecord::Migration
  def self.up
    create_table :dashboards do |t|
      t.string :name
      t.string :url
      t.integer :user_id
      t.decimal :lat
      t.decimal :lng
      t.integer :radius

      t.timestamps
    end
  end

  def self.down
    drop_table :dashboards
  end
end
