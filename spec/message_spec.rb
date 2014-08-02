require 'spec_helper'
require "#{LIB_ROOT}/receipts/message.rb"

msg_path = FODDER_ROOT + '/message.json'

describe Receipts::Message do
  before(:each) do
    @msg = Receipts::Message.new
  end

  it 'should take a message' do
    m = Receipts::Message.new File.read(msg_path)
    expect(m.text).to eq File.read(msg_path)
  end

  it 'can be assigned a message' do
    m = Receipts::Message.new
    m.text = File.read(msg_path)

    expect(m.text).to eq File.read(msg_path)
  end

  it 'should parse the message' do
    @msg.text = File.read(msg_path)
    expect(@msg.parsed.class).to eq Hash
    expect(@msg.parsed['carrier']).to eq 'Verizon Wireless'
  end

  it 'should raise an error on invalid JSON' do
    expect(@msg).to receive(:text).and_return('not json')
    expect {@msg.parsed}.to raise_error
  end

  it 'knows all keys' do
    @msg.text = File.read(msg_path)
    expect(@msg.keys).to match_array([
      'event',
      'type',
      'campaign_id',
      'msisdn',
      'shortcode',
      'carrier',
      'carrier_id',
      'message',
      'subject',
      'images'
    ])
  end

  context 'delegated' do
    before(:each) do
      @del = Receipts::Message.new File.read(msg_path)
    end

    it 'can access the keys directly' do
      @del.text = File.read(msg_path)
      expect(@del.carrier).to eq 'Verizon Wireless'
    end

    it 'fails if the method is really missing' do
      expect {@del.not_a_key}.to raise_error
    end

    it 'responds to keys' do
      expect(@del.respond_to?(:carrier)).to be true
    end

    it 'doesnt respond to not keys' do
      expect(@del.respond_to?(:not_a_key)).to be false
    end

    it 'knows how many images' do
      expect(@del.images.size).to eq 1
    end
  end
end