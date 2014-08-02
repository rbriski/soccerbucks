require 'sinatra/base'
require 'json'
require 'receipts/message'

class Receipts < Sinatra::Base
  set :sessions, true

  get '/' do
    'ehllo'
  end

  post '/in' do
    raw = request.env["rack.input"].read
    msg = Receipts::Message.new raw
  end
end