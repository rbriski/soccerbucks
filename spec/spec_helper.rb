require 'dotenv'
Dotenv.load

LIB_ROOT = File.dirname(__FILE__) + '/../lib'
FODDER_ROOT = File.dirname(__FILE__) + '/fodder'

require 'rspec/expectations'
require 'database_cleaner'
require 'sequel'

DB = Sequel.connect(ENV.fetch("DATABASE_URL_TEST"))

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.run_all_when_everything_filtered = true

  # Enforce expect syntax
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
