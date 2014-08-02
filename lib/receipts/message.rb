require 'json'

module Receipts
  class Message
    attr_accessor :text

    def initialize(msg=nil)
      if msg
        self.text = msg
      end
    end

    def parsed
      @parsed ||= JSON.parse(self.text)
    end

    def keys
      self.parsed.keys
    end

    def method_missing(meth, *args, &block)
      if self.keys.include?(meth.to_s)
        return self.parsed[meth.to_s]
      else
        super
      end
    end

    def respond_to?(meth, include_private=false)
      if self.keys.include?(meth.to_s)
        return true
      end
      return false
    end
  end
end