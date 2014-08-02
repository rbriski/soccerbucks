require 'sinatra/base'
require 'json'

class Receipts < Sinatra::Base
  set :sessions, true

  get '/' do
    'ehllo'
  end

  post '/in' do
    raw = request.env["rack.input"].read
    puts raw
    puts raw.class.name
    puts JSON.parse(raw)
  end

  post '/in/:data' do
    puts params[:data]
  end
end