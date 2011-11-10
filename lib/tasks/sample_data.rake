namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@tourioushq.com"
      password = "password"
      User.create!(:name => name)
    end

    # Create a dashboard
    d = Dashboard.create!(:name => "Sample dashboard",
                  :lat => 47.615739,
                  :lng => -122.326713,
                  :radius => 500,
                  :user => admin)

    # Create a jukebox
    j = Jukebox.create!(:name => "Sample jukebox",
                  :dashboard => d)

    # Create songs
    Song.create(:artist => "Ellie Golding",
              :name => "Lights (Bassnectar Remix)",
              :grooveshark_song_id => 29008173,
              :album_art => "lights.jpg",
              :jukebox_id => j)
    Song.create(:artist => "Maroon 5",
              :name => "Moves like Jagger",
              :grooveshark_song_id => 31315624,
              :album_art => "jagger.jpg",
              :jukebox_id => j)
    Song.create(:artist => "Lil' Wayne",
              :name => "How to love",
              :grooveshark_song_id => 30719004,
              :album_art => "howtolove.jpg",
              :jukebox_id => j)
    Song.create!(:artist => "Radiohead",
              :name => "Karma Police",
              :grooveshark_song_id => 23432550,
              :album_art => "karmapolice.jpg",
              :jukebox_id => j)
    Song.create!(:artist => "Ben Folds",
              :name => "Fred Jones, Part 2",
              :grooveshark_song_id => 14520705,
              :album_art => "fredjones.jpg",
              :jukebox_id => j)
    Song.create!(:artist => "Why?",
              :name => "Sanddollars",
              :grooveshark_song_id => 12975951,
              :album_art => "why.jpg",
              :jukebox_id => j)
    Song.create!(:artist => "Cat Stevens",
              :name => "Tea for the Tillerman",
              :grooveshark_song_id => 25923659,
              :album_art => "catstevens.jpg",
              :jukebox_id => j)
    Song.create!(:artist => "The Shins",
              :name => "Kissing the Lipless",
              :grooveshark_song_id => 7288033,
              :album_art => "shins.jpg",
              :jukebox_id => j)
    Song.create!(:artist => "The Rolling Stones",
              :name => "Paint it Black",
              :grooveshark_song_id => 43501,
              :album_art => "stones.jpg",
              :jukebox_id => j)
  end
end
