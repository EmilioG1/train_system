class Time
  attr_reader :id
  attr_accessor :Time

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
    
  end
end