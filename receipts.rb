require 'sinatra/base'

class Receipts < Sinatra::Base
  set :sessions, true

  get '/' do
    'ehllo'
  end

  post '/in' do
    raw = request.env["rack.input"].read
    puts raw
  end

  post '/in/:data' do
    puts params[:data]
  end
end