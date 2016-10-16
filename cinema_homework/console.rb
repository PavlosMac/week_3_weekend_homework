require_relative('models/films')
require_relative('models/customers')
require_relative('models/tickets')
require( 'pry-byebug')

Film.delete_all
Customer.delete_all
Ticket.delete_all

film1 = Film.new( {'title' => 'King of the Road', 'price' => 10.00 } ) 
film1.save
film2 = Film.new( {'title' => 'The Matrix', 'price' => 15.00 } )
film2.save
film3 = Film.new( {'title' => 'Lord of the rings', 'price' => 10.00} )
film3.save
film2.price = 10.00
film2.update

customer1 = Customer.new( {'name' => 'Paul MaCasgill', 'funds' => 50.00} )
customer1.save
customer2 = Customer.new( {'name' => 'Dereck Nicolson', 'funds' => 45.00} )
customer2.save
customer3 = Customer.new( {'name' => 'Alfy Mcliky', 'funds' => 55.00} )
customer3.save
customer3.funds = 50.00
customer3.update





ticket1 = Ticket.new( {'customer_id' => customer1.id, 'film_id' => film2.id } )
ticket1.save
ticket2 = Ticket.new( {'customer_id' => customer2.id, 'film_id' => film3.id} )
ticket2.save
ticket3 = Ticket.new( {'customer_id' => customer3.id, 'film_id' => film2.id} )
ticket3.save


customer4 = Customer.new( {'name' => 'John Jones', 'funds' => 50.00} )



binding.pry
nil

