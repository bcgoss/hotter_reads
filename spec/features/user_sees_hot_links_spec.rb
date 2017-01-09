require 'rails_helper'

RSpec.describe Read do
  it 'index has a list of ten hot reads' do
    11.times do |n|
      (n+1).times do
        create :read, url: "http://www.example.com/#{n}"
      end
    end

    visit root_path

    expect(page).to have_content('http://www.example.com/', count: 10)
  end
end
