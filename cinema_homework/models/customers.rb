require_relative('../db/sql_runner')

class Customer

  attr_accessor :id, :name, :funds

def initialize( options )
  @id = options['id'].to_i
  @name = options['name']
  @funds = options['funds'].to_f
end


def save
  sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING *"
  results = SqlRunner.run(sql).first #we are given back by postres a array type thing containing a hash.
  @id = results['id'].to_i
end

def update
  sql = "UPDATE customers SET name = '#{@name}', funds = #{@funds} WHERE id = #{@id}"
  SqlRunner.run(sql)
end

def delete
  sql = "DELETE FROM customers WHERE id = #{@id}"
  SqlRunner.run(sql)
end

def films
  sql = "SELECT f.* FROM films f INNER JOIN tickets t ON t.film_id = f.id WHERE t.customer_id = #{@id};"
  results = Film.map_items(sql)
end

def tickets
  sql = "SELECT * FROM tickets WHERE customer_id = #{@id}"
  result = Ticket.map_items(sql)
  return result
end

def self.delete_all
  sql = "DELETE FROM customers "
  SqlRunner.run(sql)
end

def self.all
  sql = "SELECT * FROM customers"
  results = Customer.map_items(sql)
  return results
end

def self.map_items(sql)
  results = SqlRunner.run(sql)
  return results.map{|customer| Customer.new(customer)}
end


end