namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User")
    steven = User.create(:name => "Steven Buss", :facebook_id => 2033308)
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
    s1 = Song.create(:artist => "Ellie Golding",
              :name => "Lights (Bassnectar Remix)",
              :grooveshark_song_id => 29008173,
              :album_art => "lights.jpg",
              :length => 4 * 60 + 41,
              :jukebox_id => j)
    s2 = Song.create(:artist => "Maroon 5",
              :name => "Moves like Jagger",
              :grooveshark_song_id => 31315624,
              :album_art => "jagger.jpg",
              :length => 3 * 60 + 21,
              :jukebox_id => j)
    s3 = Song.create(:artist => "Lil' Wayne",
              :name => "How to love",
              :grooveshark_song_id => 30719004,
              :album_art => "howtolove.jpg",
              :length => 3 * 60 + 59,
              :jukebox_id => j)
    Song.create!(:artist => "Radiohead",
              :name => "Karma Police",
              :grooveshark_song_id => 23432550,
              :album_art => "karmapolice.jpg",
              :length => 4 * 60 + 23,
              :jukebox_id => j)
    Song.create!(:artist => "Ben Folds",
              :name => "Fred Jones, Part 2",
              :grooveshark_song_id => 14520705,
              :album_art => "fredjones.jpg",
              :length => 3 * 60 + 46,
              :jukebox_id => j)
    Song.create!(:artist => "Why?",
              :name => "Sanddollars",
              :grooveshark_song_id => 12975951,
              :album_art => "why.jpg",
              :length => 3 * 60 + 44,
              :jukebox_id => j)
    Song.create!(:artist => "Cat Stevens",
              :name => "Tea for the Tillerman",
              :grooveshark_song_id => 25923659,
              :album_art => "catstevens.jpg",
              :length => 1 * 60 + 2,
              :jukebox_id => j)
    Song.create!(:artist => "The Shins",
              :name => "Kissing the Lipless",
              :grooveshark_song_id => 7288033,
              :album_art => "shins.gif",
              :length => 3 * 60 + 19,
              :jukebox_id => j)
    Song.create!(:artist => "The Rolling Stones",
              :name => "Paint it Black",
              :grooveshark_song_id => 43501,
              :album_art => "stones.jpg",
              :length => 3 * 60 + 45,
              :jukebox_id => j)
    Song.create!(:artist => "Crosby, Stills, And Nash",
              :name => "Cathedral",
              :grooveshark_song_id => 14662325,
              :album_art => "csn.jpg",
              :length => 5 * 60 + 16,
              :jukebox_id => j)
    Song.create!(:artist => "The Arcade Fire",
              :name => "Naive Melody",
              :grooveshark_song_id => 28148526,
              :album_art => "arcadefire.png",
              :length => 4 * 60 + 41,
              :jukebox_id => j)
    Song.create!(:artist => "Otis Redding",
              :name => "(Sittin' On) The Dock of the Bay",
              :grooveshark_song_id => 23332991,
              :album_art => "otis.jpg",
              :length => 2 * 60 + 45,
              :jukebox_id => j)

    VotingRound.create(:song_id_1 => s1.id,
                       :song_id_2 => s2.id,
                       :song_id_3 => s3.id,
                       :jukebox_id => j.id)
  end
end
