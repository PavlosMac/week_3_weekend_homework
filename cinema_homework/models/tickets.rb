require_relative('../db/sql_runner')

class Ticket

  attr_accessor :id, :customer_id, :film_id, :customer, :film

  def initialize( film, customer )
    @id = id
    @film_id = film.id.to_i
    @customer_id = customer.id.to_i
    @customer = customer
    @film = film
  end

  def create
    sql = "INSERT INTO tickets (film_id, customer_id) VALUES (#{@film_id}, #{@customer_id}) RETURNING * "
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
    return deduct_customer_funds
  end

  def deduct_customer_funds
    @customer.funds -= @film.price
    return @customer.update
  end


  def self.all
    sql = "SELECT * FROM tickets"
    return Ticket.map_items(sql)
  end

  def self.delete_all
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    results = SqlRunner.run(sql)
    return results.map{ |ticket| Ticket.new(ticket) }
  end

  def self.map_item(sql)
    results = Ticket.map_items(sql)
    return results.first
  end



end