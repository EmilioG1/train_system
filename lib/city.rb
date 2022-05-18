require 'pry'
class City
  attr_reader :id
  attr_accessor :name, :state
  
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @state = attributes.fetch(:state)
    @id = attributes.fetch(:id)
  end

  def ==(city_to_compare)
    (self.name == city_to_compare.name) && (self.state == city_to_compare.state) && (self.id == city_to_compare.id)
  end

  def self.all 
    returned_cities = DB.exec("SELECT * FROM cities;")
    cities = []
    returned_cities.each() do |city|
      name = city.fetch("name")
      state = city.fetch("state")
      id = city.fetch("id").to_i
      cities.push(City.new({:name => name, :state => state, :id => id}))
    end
    cities
  end

  def self.clear
    DB.exec("DELETE FROM cities *;")
  end

  def self.find(id)
    cities = DB.exec("SELECT * FROM cities WHERE id = #{id};").first
    name = cities.fetch("name")
    state = cities.fetch("state")
    id = cities.fetch("id").to_i
    City.new({:name => name, :state => state, :id => id})
  end

  def delete 
    DB.exec("DELETE FROM cities WHERE id = #{id};")
  end

  def save 
    result = DB.exec("INSERT INTO cities (name, state) VALUES ('#{name}', '#{state}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end
  
  def update(attributes)
    if (attributes.has_key?(:name)) && (attributes.fetch(:name) != nil)
      @name = attributes.fetch(:name)
      DB.exec("UPDATE cities SET name = '#{name}' WHERE id = #{id};")
    elsif (attributes.has_key?(:train_name)) && (attributes.fetch(:train_name) != nil)
      train_name = attributes.fetch(:train_name)
      train = DB.exec("SELECT * FROM trains WHERE lower(name)='#{train_name.downcase}';").first
      if train != nil
        DB.exec("INSERT INTO cities_trains (city_id, train_id) VALUES (#{@id}, #{train['id'].to_i});")
      end
    end
  end

  def trains
    trains = []
    results = DB.exec("SELECT train_id FROM cities_trains WHERE city_id = #{@id};")
    results.each do |result|
      train_id = result.fetch("train_id").to_i
      train = DB.exec("SELECT * FROM trains WHERE id = #{train_id};")
      name = train.first.fetch("name")
      time_id = train.first.fetch("time_id").to_i
      trains.push(Train.new({:name => name, :time_id => time_id, :id => train_id}))
    end
    trains
  end
end