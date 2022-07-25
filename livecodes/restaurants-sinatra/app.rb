require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/activerecord"
require "pry-byebug"
require "better_errors"
require_relative "config/application"

get "/" do
  @restaurants = Restaurant.all.order(created_at: :desc)
  erb :index
end

get '/restaurants/:id' do
  id = params[:id]
  @restaurant = Restaurant.find(id)
  erb :show
end

post '/restaurants' do
  name = params[:name]
  address = params[:address]
  restaurant = Restaurant.new(name: name, address: address)
  restaurant.save

  redirect "/restaurants/#{restaurant.id}"
end
