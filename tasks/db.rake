namespace :db do
  desc "Run migrations"
  task :migrate, [:version] do |t, args|
    Sequel.extension :migration
    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(DB, "db/migrations", target: args[:version].to_i)
    else
      puts "Migrating to latest"
      Sequel::Migrator.run(DB, "db/migrations")
    end
  end

  task :migrate_test, [:version] do |t, args|
    DB_TEST = Sequel.connect(ENV.fetch('DATABASE_URL_TEST'))
    Sequel.extension :migration
    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(DB_TEST, "db/migrations", target: args[:version].to_i)
    else
      puts "Migrating to latest"
      Sequel::Migrator.run(DB_TEST, "db/migrations")
    end
  end
end
