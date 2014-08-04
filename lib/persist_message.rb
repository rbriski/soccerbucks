require 'receipts/message'
require 'models/message'
require 'models/image'

class PersistMessage
  def self.save(msg_text)
    msg = Receipts::Message.new(msg_text)

    saved_msg = Models::Message.new
    msg.keys.reject { | k | k == 'images' }.each do | key |
      if saved_msg.respond_to?(key)
        saved_msg.send("#{key}=", msg.send(key))
      end
    end
    saved_msg.save

    msg.images.each do | img |
      saved_msg.add_image(Models::Image.new(:path => img['image']))
    end
  end

end