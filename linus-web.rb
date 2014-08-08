#!/usr/bin/env ruby

require 'sinatra'
require 'slim'
require 'faker'

set :slim, :pretty => true

get "/" do
  slim :index
end
