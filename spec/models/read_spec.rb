require 'rails_helper'

RSpec.describe Read, type: :model do
  it 'validates uri format' do
    read = Read.new(url: 'https://www.example.com')
    expect(read.save).to eq true

    bad_url = Read.new(url: 'foo')
    expect(bad_url.save).to eq false

    close_but_wrong = Read.new(url: 'www.example.com')
    expect(close_but_wrong.save).to eq false
  end

  it 'collects the ten hottest reads' do
    11.times do |n|
      (n+1).times do
        create :read, url: "http://www.example.com/#{n}"
      end
    end

    hot_reads = Read.hot

    expect(hot_reads.length).to eq 10
  end
end
