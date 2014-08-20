require 'sinatra/base'
require 'json'
require 'persist_message'
require 'mogreet'

# heroku pg:psql -c "copy (select id, path as image_url from images) to stdout csv header"
class Soccerbucks < Sinatra::Base
  set :sessions, true

  get '/' do
    'ehllo'
  end

  post '/in' do
    raw = request.env["rack.input"].read
    msg = PersistMessage.save(raw)

    if msg.message.downcase.include?('practice')
      @api = Mogreet.new(msg.msisdn)
      puts @api.send_message('this thursday')
    end

    if msg.message.downcase.include?('game')
      @api = Mogreet.new(msg.msisdn)
      puts @api.send_message('next game')
    end

    200
  end
end