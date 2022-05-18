class Ticket

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @cost = attributes.fetch(:cost)
  end

  def self.all
    returned_tickets = DB.exec("SELECT * FROM tickets")
    tickets = []
    returned_tickets.each() do |ticket|
      cost = ticket.fetch("cost")
      id = ticket.fetch("id")
      tickets.push(Ticket.new({:cost => cost, :id => id}))
    end
    tickets
  end

  def ==(ticket_to_compare)
    self.id == ticket_to_compare.id
  end
  
  def self.clear
    DB.exec("DELETE FROM tickets *;")
  end
  
  def self.find(id)
    tickets = DB.exec("SELECT * FROM tickets WHERE id = #{id};").first
    id = cities.fetch("id").to_i
    cost = cities.fetch("cost").to_i
    Ticket.new({:id => id, :cost => cost})
  end

  def self.find_by_passenger(passenger_id)
    tickets = []
    
  end

  def delete
    DB.exec("DELETE FROM passengers WHERE ticket_id = #{id};")
    DB.exec("DELETE FROM tickets WHERE id = #{id};")
  end

  def save
    result = DB.exec("INSERT INTO tickets (cost) VALUES (#{cost}) RETURNING id;")
    @id = result.first.fetch("id").to_i
  end
end