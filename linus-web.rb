#!/usr/bin/env ruby

require 'sinatra'
require 'slim'
require 'faker'

set :slim, :pretty => true

get "/" do
  @pets = [
    {
      name: 'Linus',
      age: '6 weeks'
    }
  ]
  @pet = 'Linus'
  slim :index
  # slim :index, :locals => { :pets => @pets }
end
