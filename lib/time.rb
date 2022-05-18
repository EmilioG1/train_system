class Time
  attr_reader :id
  attr_accessor :time

  def initialize(attributes)
    @time = attributes.fetch(:time)
    @id = attributes.fetch(:id)
  end

  def ==(time_to_compare)
    self.id == time_to_compare.id
  end

  def self.all
    returned_times = DB.exec("SELECT * FROM times;")
    times = []
    returned_times.each do |time|
      time = time.fetch('time')
      id = time.fetch('id').to_i
      times.push(Time.new({:time => time, :id => id}))
    end
    times
  end

  def save 
    result = DB.exec("INSERT INTO times (time) VALUES ('#{time}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def self.clear
    DB.exec("DELETE FROM times *;")
  end

  def self.find(id)
    times = DB.exec("SELECT * FROM times WHERE id = #{id};").first
    if times
      time = times.fetch('time')
      id = time.fetch('id').to_i
      Time.new({:time => time, :id => id})
    else
     nil
    end
  end

  def update(time)
    @time = time
  end
  
  def delete
    DB.exec("DELETE FROM times WHERE id = #{@id};")
  end
end