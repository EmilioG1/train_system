require 'pry'

class Train
  attr_reader :id, :time_id
  attr_accessor :name

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @time_id = attributes.fetch(:time_id)
    @name = attributes.fetch(:name)
  end

  def self.all
    returned_trains = DB.exec("SELECT * FROM trains;")
    trains = []
    returned_trains.each() do |train|
      name = train.fetch("name")
      id = train.fetch("id").to_i
      time_id = train.fetch("time_id").to_i
      trains.push(Train.new({:name => name, :id => id, :time_id => time_id}))
    end
    trains
  end

  def ==(train_to_compare)
    (self.name == train_to_compare.name) && (self.id == train_to_compare.id) && (self.time_id == train_to_compare.time_id)
  end

  def self.clear
    DB.exec("DELETE FROM trains *;")
  end

  def self.find(idexit)
    trains = DB.exec("SELECT * FROM trains WHERE id = #{id};").first
    name = trains.fetch("name")
    id = trains.fetch("id").to_i
    time_id = trains.fetch("time_id").to_i
    Train.new({:name => name, :id => id, :time_id => time_id})
  end

  # def find_city
  #   DB.exec("SELECT times.* FROM trains JOIN cities_trains ON (trains.id = cities_trains.train_id) JOIN times ON (cities_trains.city_id == cities.id) WHERE trains.id = #{@id};")
  #   # DB.exec("JOIN cities_trains ON (trains.id = cities_trains.train_id);")
  #   # DB.exec("JOIN times ON (cities_trains.city_id == cities.id) WHERE trains.id = #{@id};")
  # end

  def delete
    DB.exec("DELETE FROM cities_trains WHERE train_id = #{@id};")
    DB.exec("DELETE FROM trains WHERE id = #{@id};")
  end

  def save
    result = DB.exec("INSERT INTO trains (name, time_id) VALUES ('#{name}', #{time_id}) RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  def update(attributes)
    if (attributes.has_key?(:name)) && (attributes.fetch(:name) != nil)
      @name = attributes.fetch(:name)
      DB.exec("UPDATE trains SET name = '#{name}' WHERE id = #{id};")
    elsif (attributes.has_key?(:city_name)) && (attributes.fetch(:city_name) != nil)
      city_name = attributes.fetch(:city_name)
      city = DB.exec("SELECT * FROM cities WHERE lower(name)='#{city_name.downcase}';").first
      if city != nil
        DB.exec("INSERT INTO cities_trains (city_id, train_id) VALUES (#{city['id'].to_i}, #{@id});")
      end
    end
  end

  def cities
    cities = []
    results = DB.exec("SELECT city_id FROM cities_trains WHERE train_id = #{@id};")
    results.each do |result|
      city_id = result.fetch("city_id").to_i
      city = DB.exec("SELECT * FROM cities WHERE id = #{city_id};")
      name = city.first.fetch("name")
      state = city.first.fetch("state")
      cities.push(City.new({:name => name, :state => state, :id => city_id}))
    end
    cities
  end
end