buildings = 100
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
6.times do
	Category.create(name: Faker::Commerce.department)
end
Category.all.count.times do |i|
	[2,3,4,5,6].sample.times do
		Category.create(name: Faker::Commerce.department, parent_id: i+1)
	end
end

puts "Adding managers.."
managers.times do |i|
	saved = false
	m = Manager.new
	m.first_name	= Faker::Name.first_name
	m.last_name		= Faker::Name.last_name
	m.password		= Faker::Internet.password(8, 12)
	m.phone_number= Faker::PhoneNumber.cell_phone
	while !saved do
		m.email = Faker::Internet.email
		saved = true if m.save
	end
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
			saved = false
			t = Tenant.new
			t.first_name	= Faker::Name.first_name
			t.last_name		= Faker::Name.last_name
			t.password		= Faker::Internet.password(8, 12)
			t.phone_number= Faker::PhoneNumber.cell_phone
			t.apartment		= app_num
			t.is_approved	= true
			t.building		= b
			while !saved do
				t.email	= Faker::Internet.email
				saved = true if t.save
			end
		end
	end
	b.manager_id = Manager.all.sample.id
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
		i.tenant_id = Tenant.all.sample.id
		i.save
		i.categories << Category.all.sample
		if y%1000 == 0
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
		c.issue_id = Issue.all.sample.id
		if fifty_fifty.sample
			c.commentable_id = c.issue.tenant.id
			c.commentable_type = 'Tenant'
		else
			c.commentable_id = c.issue.tenant.building.manager.id
			c.commentable_type = 'Manager'
		end
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
puts "#{Manager.all.count} managers added"
puts "#{Building.all.count} buildings added"
puts "#{Tenant.all.count} tenants added"
puts "#{Issue.all.count} issues added"
puts "#{Comment.all.count} comments added"
puts "Done in #{(finish_time - start_time).to_i / 60} minutes and #{(finish_time - start_time).to_i % 60} seconds"
