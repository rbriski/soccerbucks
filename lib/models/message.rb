require 'sequel'
require 'models/image'

module Models
  class Message < Sequel::Model
    one_to_many :images
  end
end
