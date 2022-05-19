require('sinatra')
require('sinatra/reloader')
require('./lib/city')
require('./lib/train')
require('./lib/time')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "train_system"})

get('/') do
  @trains = Train.all
  erb(:trains)
end

get('/trains') do
  @trains = Train.all
  erb(:trains)
end

get('/cities') do
  @cities = City.all
  erb(:cities)
end

get('/trains/new') do
  erb(:new_trains)
end

get('/cities/new') do
  erb(:new_cities)
end

post('/trains') do
  name = params[:train_name]
  input_time = params[:train_time]
  time = Train_Time.new({:arrive_time => input_time, :id => nil})
  time.save
  train = Train.new({:name => name, :time_id => time.id, :id => nil})
  train.save
  @trains = Train.all
  erb(:trains)
end

post('/cities') do
  name = params[:city_name]
  state = params[:state]
  city = City.new({:name => name, :state => state, :id => nil})
  city.save
  @cities = City.all
  erb(:cities)
end

get('/trains/:id/edit') do
  @train = Train.find(params[:id].to_i())
  erb(:edit_train)
end

get('/cities/:id/edit') do
  @city = City.find(params[:id].to_i())
  erb(:city)
end