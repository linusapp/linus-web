#!/usr/bin/env ruby

require 'sinatra'
require 'slim'
require 'json'

set :slim, :pretty => true

get "/" do
  @page_data = JSON.parse(File.read('page_data.json'), :symbolize_names => true)
  slim :index
end
