# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts 'Populating concerns...'

[ { :name => 'No service delivery in Kliptown', 
		:description => 'We are tired of not receiving basic services in our town.', 
		:location => 'Kliptown, Soweto, South Africa'
	},
	{ :name => 'No service delivery in Thembisa', 
		:description => 'We are tired of not receiving basic services in our town.', 
		:location => 'Thembisa, South Africa'
	},
	{ :name => 'No service delivery in Sanhurst', 
		:description => 'There is no parking space for my 7 BMWs...', 
		:location => 'Sandhurst, Sandton, South Africa'
	},
].each do |account_option|
	# New rails 4 syntax instead of find_or_create_by_name
	Concern.where(:name => account_option[:name]).first_or_create(:description => account_option[:description], :location => account_option[:location])
end

puts Concern.all