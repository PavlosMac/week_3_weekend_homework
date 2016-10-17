require_relative('../db/sql_runner')

class Ticket

  attr_accessor :id, :customer_id, :film_id

  def initialize( options )
    @id = id
    @film_id = options['film_id'].to_i
    @customer_id = options['customer_id'].to_i
  end

 
  def self.sell(film, customer)
      customer.funds -= film.price
      customer.update
      sql = "INSERT INTO tickets (film_id, customer_id) VALUES (#{film.id}, #{customer.id}) RETURNING *"
      result = SqlRunner.run(sql).first
      @id = result['id'].to_i
      ticket = Ticket.map_item(sql)
      return ticket
  end

  def customer
    sql = "SELECT * FROM customers WHERE id = #{@customer_id}"
    result = Customer.map_item(sql)
    return result
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