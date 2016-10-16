require_relative('../db/sql_runner')

class Film

  attr_accessor :id, :title, :price

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_f
  end


  def save
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', #{@price}) RETURNING * "
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end 

  
  def update
    sql = "UPDATE films SET title = '#{@title}',  price = #{@price} WHERE id = #{@id}; "
    SqlRunner.run(sql)
  end

  def customers
    sql = "SELECT c.* FROM customers c INNER JOIN tickets t ON t.customer_id = c.id WHERE t.film_id = #{@id};"
    results = Film.map_items(sql)
  end

  def total_customers
    return customers.count
  end

  def tickets
    sql = "SELECT * FROM tickets WHERE film_id = #{@id};"
    result = Ticket.map_item(sql)
    return result
  end

  
  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  

  def self.all # this method is our READ method, it calls the map items method below
    sql = "SELECT * FROM films "
    return Film.map_items(sql)
  end

  

  def self.map_items(sql)# this method gets called by our READ method
    results = SqlRunner.run(sql)
    return results.map{ |film| Film.new(film) }
  end 

  

  def self.map_item(sql)# this will get used to call one item from film class.
    results = Film.map_items
    return results.first
  end

  





end