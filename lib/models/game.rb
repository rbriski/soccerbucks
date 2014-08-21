require 'sequel'

module Models
  class Game < Sequel::Model(:games)
    def self.next
      self.where('scheduled_at >= ?', Time.now).order(:scheduled_at).first
    end
  end
end
