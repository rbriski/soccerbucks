require 'sinatra/base'
require 'json'
require 'persist_message'
require 'receipts/message'

class Soccerbucks < Sinatra::Base
  set :sessions, true

  get '/' do
    'ehllo'
  end

  post '/in' do
    raw = request.env["rack.input"].read
    msg = Receipts::Message.new(raw)
    puts msg.inspect
  end
end