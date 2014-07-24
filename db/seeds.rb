buildings = 200
tenants = [1, 1, 2, 2, 2, 3, 3, 3, 4, 5]
app_per_building = (20..100)
managers = (buildings * 0.7).to_i
fifty_fifty = [false, true]
statuses = [:new, :done, :done, :done, :done]
start_time = Time.now

puts "---------"
puts "  SEEDS  "
puts "---------"
puts "Adding categories.."
10.times do
	Category.create(name: Faker::Commerce.department)
end
Category.all.count.times do |i|
	[3,4,5,6,7].sample.times do
		Category.create(name: Faker::Commerce.department, parent_id: i+1)
	end
end

puts "Adding managers.."
managers.times do |i|
	m = Manager.new
	m.first_name	= Faker::Name.first_name
	m.last_name		= Faker::Name.last_name
	# m.password		= Faker::Internet.password
	m.email				= Faker::Internet.free_email
	m.phone_number= Faker::PhoneNumber.cell_phone
	m.save
end

print "Adding buildings and tenants "
buildings.times do |i|
	b = Building.new
	b.street			= Faker::Address.street_address
	b.postal_code	= Faker::Address.postcode
	b.city				= Faker::Address.city
	b.country			= 'Canada'
	app_per_building.to_a.sample.times do
		app_num = Faker::Address.secondary_address
		tenants.sample.times do
			t = Tenant.new
			t.first_name	= Faker::Name.first_name
			t.last_name		= Faker::Name.last_name
			t.password		= Faker::Internet.password(8, 12)
			t.email				= Faker::Internet.free_email
			t.phone_number= Faker::PhoneNumber.cell_phone
			t.apartment		= app_num
			t.is_approved	= true
			t.building		= b
			t.save
		end
	end
	b.manager_id = rand(Manager.all.count) + 1
	b.company_id = rand(Company.all.count) + 1 if fifty_fifty.sample
	b.save
	if i%5 == 0
		print '.'
	end
end
puts

print "Adding issues "
buildings.times do |id|
	b = Building.find(id+1)
	tenants = b.tenants.count
	rand(tenants*2).times do |y|
		i = Issue.new
		i.title = Faker::Lorem.sentence(1, false, 3)
		i.message = Faker::Lorem.paragraph
		i.status = statuses.sample
		if i.status == :done
			i.complete_date = Time.now - rand(1..200).days - rand(0..23).hours - rand(0..59).minutes
			i.created_at = i.complete_date - rand(1..10).days
			i.rating = [1,2,3,4,5].sample
		else
			i.created_at = Time.now - rand(1..9).days - rand(0..23).hours - rand(0..59).minutes
		end
		i.tenant_id = rand(Tenant.all.count) + 1
		i.save
		i.categories << Category.all.sample
		if y%500 == 0
			print '.'
		end
	end
end
puts

print "Adding comments "
Issue.all.count.times do |i|
	if fifty_fifty.sample
		c = Comment.new
		c.message = Faker::Lorem.paragraph
		c.issue_id = rand(Issue.all.count) + 1
		fifty_fifty.sample ? c.user = c.issue.tenant : c.user = c.issue.tenant.building.manager
		c.save
	end
	if i%1000 == 0
		print '.'
	end
end

finish_time = Time.now

puts
puts "----- RESULT -----"
puts "#{Category.all.count} categories added"
puts "#{Company.all.count} companies added"
puts "#{Manager.all.count} managers added"
puts "#{Building.all.count} buildings added"
puts "#{Tenant.all.count} tenants added"
puts "#{Issue.all.count} issues added"
puts "#{Comment.all.count} comments added"
puts "Done in #{(finish_time - start_time).to_i / 60} minutes and #{(finish_time - start_time).to_i % 60} seconds"
