require 'rspec'
require 'pry'
require 'pg'
require 'city'
require 'train'

DB = PG.connect({:dbname => 'train_system_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec('DELETE FROM cities *;')
    DB.exec('DELETE FROM trains *;')
  end
end