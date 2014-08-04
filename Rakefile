$:.unshift File.dirname(__FILE__) + "/lib"

require 'rubygems'
require 'bundler'

Bundler.require

DB = Sequel.connect(ENV.fetch("DATABASE_URL"))

Dir['tasks/*.rake'].each { |r| import r }