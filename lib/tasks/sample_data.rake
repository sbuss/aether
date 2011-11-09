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
    s = Song.create(:artist => "Ellie Golding",
              :name => "Lights (Bassnectar Remix)",
              :grooveshark_song_id => 29008173,
              :jukebox_id => j)
    
    s = Song.create(:artist => "Maroon 5",
              :name => "Moves like Jaggar",
              :grooveshark_song_id => 31315624,
              :jukebox_id => j)
              
    s = Song.create(:artist => "Lil' Wayne",
              :name => "How to love",
              :grooveshark_song_id => 30719004,
              :jukebox_id => j)
  end
end
