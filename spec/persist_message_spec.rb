require 'spec_helper'
require "#{LIB_ROOT}/persist_message.rb"

msg_path = FODDER_ROOT + '/message.json'

describe PersistMessage do
  before(:each) do
    PersistMessage.save(File.read(msg_path))
  end

  it 'saves the message correctly' do
    expect(Models::Message.count).to eq 1
  end

  it 'saves the correct message' do
    msg = Models::Message.all.first
    expect(msg.carrier).to eq 'Verizon Wireless'
  end

  it 'saves the images' do
    msg = Models::Message.all.first
    expect(msg.images.count).to eq 1
  end
end