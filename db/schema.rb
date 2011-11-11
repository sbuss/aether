# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111111062546) do

  create_table "dashboards", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "user_id"
    t.decimal  "lat"
    t.decimal  "lng"
    t.integer  "radius"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jukeboxes", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "dashboard_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "grooveshark_song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "jukebox_id"
    t.string   "artist"
    t.string   "album_art"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_id"
  end

  create_table "votes", :force => true do |t|
    t.integer  "song_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voting_rounds", :force => true do |t|
    t.integer  "winning_song_id"
    t.integer  "jukebox_id"
    t.integer  "song_id_1"
    t.integer  "song_id_2"
    t.integer  "song_id_3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
