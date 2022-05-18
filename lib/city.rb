require 'pry'
attr_reader :id
attr_accessor :name, :state
class City

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @state = attributes.fetch(:state)
    @id = attributes.fetch(:id)
  end

  def == (city_to_compare)
    (self.name == city_to_compare.name) && (self.state == city_to_compare.state) && (self.id == city_to_compare.id)
  end

  def self.all 
    returned_cities = DB.exec("SELECT * FROM cities;")
    cities = []
    returned_cities.each() do |city|
      name = city.fetch("name")
      state = city.fetch("state")
      id = city.fetch("id").to_i
      cities.push(City.new({:name => name, :state => state, :id = > id}))
    end
    cities
  end
  def self.clear
    DB.exec("DELETE FROM cities *;")
  end

  def self.find(id)
    cities = DB.exec("SELECT")
  end
end