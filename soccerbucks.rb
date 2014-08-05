require 'sinatra/base'
require 'json'
require 'persist_message'

# heroku pg:psql -c "copy (select id, path as image_url from images) to stdout csv header"
class Soccerbucks < Sinatra::Base
  set :sessions, true

  get '/' do
    'ehllo'
  end

  post '/in' do
    raw = request.env["rack.input"].read
    PersistMessage.save(raw)

    200
  end
end