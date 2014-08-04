require 'sequel'
require 'models/message'

module Models
  class Image < Sequel::Model
    many_to_one :message
  end
end
