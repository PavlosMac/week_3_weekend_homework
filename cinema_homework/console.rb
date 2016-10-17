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


customer1 = Customer.new( {'name' => 'Paul MaCasgill', 'funds' => 50.00} )
customer1.save
customer2 = Customer.new( {'name' => 'Dereck Nicolson', 'funds' => 45.00} )
customer2.save
customer3 = Customer.new( {'name' => 'Alfy Mcliky', 'funds' => 55.00} )
customer3.save
customer4 = Customer.new( {'name' => 'James Watt', 'funds' => 70.00} )
customer4.save



ticket1 = Ticket.sell(film1, customer1)
# ticket2 = Ticket.sell(film3, customer2)
# ticket3 = Ticket.sell(film2, customer4)





binding.pry
nil

