require 'sinatra/base'
require 'json'
require 'persist_message'

class Receipts < Sinatra::Base
  set :sessions, true

  get '/' do
    'ehllo'
  end

  post '/in' do
    raw = request.env["rack.input"].read
    PersistMessage.save(raw)
  end
end