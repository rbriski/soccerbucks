require 'rubygems'
require 'bundler'

$stdout.sync = true

Bundler.require

require './receipts'
run Receipts