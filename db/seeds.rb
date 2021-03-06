# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Band.create( :name => "Megahead" )
Band.create( :name => "Deathfork" )
Band.create( :name => "Potato Palace" )

Album.create([{ :name => "Hairball", :year => "2002", :band => Band.first },
	{ :name => "Frustration", :year => "2013", :band => Band.first },
	{ :name => "Satisfaction", :year => "2001", :band => Band.first },
	{ :name => "Garlic", :year => "1999", :band => Band.find(2) }])

Track.create([{ :title => "Cats", :ord => 1, :album => Album.first },
	{ :title => "Dogs", :ord => 2, :album => Album.first },
	{ :title => "Hamsters", :ord => 3, :album => Album.first },
	{ :title => "Skulls", :ord => 1, :album => Album.find(2) },
	{ :title => "Crossbones", :ord => 2, :album => Album.find(2) }])

User.create([{ :email => "bob@bob.com", :password => "password", :activated => true },
	{ :email => "ted@ted.com", :password => "password", :activated => true },
	{ :email => "admin@admin.com", :password => "password", :activated => true, :user_type => "admin" } ])

Note.create([{ :track => Track.first, :text => "This song is awesome!", :author => User.first },
	{ :track => Track.first, :text => "Trippy, maaaaaan...", :author => User.first },
	{ :track => Track.find(3), :text => "This song is crap.", :author => User.find(2) } ])