namespace :schedule do
  desc "Add schedule to database"
  task :import do
    games = DB[:games].multi_insert([
      {:scheduled_at => '2014-08-23 08:00:00', :opponent => 'Earthquakes'},
      {:scheduled_at => '2014-09-06 08:45:00', :opponent => 'Dreamers'},
      {:scheduled_at => '2014-09-13 10:15:00', :opponent => 'Sprockets'},
      {:scheduled_at => '2014-09-20 13:15:00', :opponent => 'Happy Feets'},
      {:scheduled_at => '2014-10-04 11:00:00', :opponent => 'Lil Patriots FC'},
      {:scheduled_at => '2014-10-11 09:30:00', :opponent => 'The Quakes'},
      {:scheduled_at => '2014-10-18 14:00:00', :opponent => 'Thundercats'},
      {:scheduled_at => '2014-10-25 10:15:00', :opponent => 'Hawks United'},
      {:scheduled_at => '2014-11-01 09:30:00', :opponent => 'Flying Dragons'},
      {:scheduled_at => '2014-11-08 11:45:00', :opponent => 'Mighty Grasshoppers'}
    ])
  end
end