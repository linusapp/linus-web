#!/usr/bin/env ruby

require 'sinatra'
require 'slim'
require 'faker'

set :slim, :pretty => true

get "/" do
  @pets = []
  10.times do |i|
    @pets.push({
      name: Faker::Name.first_name,
      age: Faker::Number.digit
    })
  end

  slim :index
  # slim :index, :locals => { :pets => @pets }
end
