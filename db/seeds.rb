# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create( :username => "bob", :email => 'bob@bob.com', :password => 'password' )

Contact.create( :name => "joe",
								:email => 'joe@joe.com',
								:address => '1 joe way',
								:phone => '(111) 222-3333',
								:user => User.first )

Contact.create( :name => "jim",
								:email => 'jim@jim.com',
								:address => '1 jim way',
								:phone => '(111) 222-3333',
								:user => User.first )

Contact.create( :name => "jed",
								:email => 'jed@jed.com',
								:address => '1 jed way',
								:phone => '(111) 222-3333',
								:user => User.first )

Favorite.create( :user => User.first,
								 :contact => Contact.first )