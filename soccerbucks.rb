require 'sinatra/base'
require 'json'
require 'persist_message'
require 'models/game'
require 'mogreet'

# heroku pg:psql -c "copy (select id, path as image_url from images) to stdout csv header"
class Soccerbucks < Sinatra::Base
  set :sessions, true

  get '/' do
    'ehllo'
  end

  post '/in' do
    raw = request.env["rack.input"].read
    puts "Received: #{raw}"

    msg = PersistMessage.save(raw)

    if msg.message.downcase.include?('practice')
      api = Mogreet.new(msg.msisdn)

      date  = Date.parse("Thursday")
      delta = date > Date.today ? 0 : 7
      dt = date + delta
      next_practice_str = "#{dt.strftime("%a %m/%d")} @ 5:00PM"

      puts api.send_message(next_practice_str)
    end

    if msg.message.downcase.include?('game')
      api = Mogreet.new(msg.msisdn)

      game = Models::Game.next
      next_game_str = "#{game.scheduled_at.strftime('%a %m/%d @ %H:%M%P')} against #{game.opponent}"
      puts api.send_message(next_game_str)
    end

    200
  end
end