require 'sinatra/base'

class Receipts < Sinatra::Base
  set :sessions, true

  get '/' do
    'ehllo'
  end

  post '/in' do
    puts params.inspect
  end

  post '/in/:data' do
    puts params[:data]
  end
end