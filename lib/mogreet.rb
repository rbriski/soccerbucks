require "addressable/uri"

class Mogreet
  include HTTParty
  base_uri ENV['MOGREET_ENDPOINT']

  def initialize(phone_number)
    @query = {
      :client_id => ENV['MOGREET_CLIENT_ID'],
      :token => ENV['MOGREET_TOKEN'],
      :campaign_id => ENV['MOGREET_SMS_CAMPAIGN_ID'],
      :to => phone_number,
      :format => :json
    }
  end

  def send_message(message)
    qry = @query.clone
    qry['message'] = message

    self.class.get('/moms/transaction.send', {:query => qry})
  end
end