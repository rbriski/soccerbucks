require 'bundler'

Bundler.require

# Set up sequel DB
DB ||= Sequel.connect(ENV.fetch("DATABASE_URL"))
Sequel.database_timezone = :utc

# Loggin stream
$stdout.sync = true

$:.unshift File.dirname(__FILE__) + "/lib"

require './soccerbucks.rb'
run Soccerbucks