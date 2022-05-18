class Train_Time
  attr_reader :id
  attr_accessor :arrive_time

  def initialize(attributes)
    @arrive_time = attributes.fetch(:arrive_time)
    @id = attributes.fetch(:id)
  end

  def ==(time_to_compare)
    self.id == time_to_compare.id
  end

  def self.all
    returned_times = DB.exec("SELECT * FROM times;")
    times = []
    returned_times.each do |time|
      arrive_time = time.fetch('arrive_time')
      id = time.fetch('id').to_i
      times.push(Train_Time.new({:arrive_time => arrive_time, :id => id}))
    end
    times
  end

  def save 
    result = DB.exec("INSERT INTO times (arrive_time) VALUES ('#{arrive_time}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def self.clear
    DB.exec("DELETE FROM times *;")
  end

  def self.find(id)
    times = DB.exec("SELECT * FROM times WHERE id = #{id};").first
    if times
      arrive_time = times.fetch('arrive_time')
      id = times.fetch('id').to_i
      Train_Time.new({:arrive_time => arrive_time, :id => id})
    else
     nil
    end
  end

  def update(time)
    @arrive_time = time
  end
  
  def delete
    DB.exec("DELETE FROM times WHERE id = #{@id};")
  end
end