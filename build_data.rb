require 'ffaker'
require 'json'

def rand_bool
  [false, true].sample
end

def pet
  {
    pet_id: nil,
    name: Faker::Name.first_name,
    age: Random.new.rand(10),
    neutered: rand_bool,
    chipped: rand_bool,
    breed: Faker::Company.name
  }
end

def user_card
  num = Random.new.rand(21)
  {
    name: Faker::Name.name,
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    phone: Faker::PhoneNumber.phone_number,
    avatar: "/images/#{num}.jpg",
    avatar_thumb: "/images/thumbs/#{num}.jpg"
  }
end

def notification
  {
    type: [:alert, :warning, :info, :success].sample,
    message: Faker::BaconIpsum.sentences(2).join(" "),
    read: rand_bool
  }
end

page_data = {
  session: {},
  pets: [],
  notifications: [],
  scheduled_events: [],
  friends: []
}

page_data[:session] = {
  logged_in: true,
  current_ip: Faker::Internet.ip_v4_address,
  current_user: user_card
}

10.times do |i|
  page_data[:pets].push pet
  page_data[:notifications].push notification
  page_data[:friends].push user_card
end

File.open('page_data.json', 'w') {|f| f.write(page_data.to_json)}
