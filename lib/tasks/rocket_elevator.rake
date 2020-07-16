namespace :rocket_elevator do
  desc "send all data from mysql to postgresql"
  task sync: :environment do
	
	connection = PG.connect(dbname: 'allo',host: 'localhost', user: 'alex', password: 'alex')
	
	connection.exec("TRUNCATE fact_quotes RESTART IDENTITY")
	Quote.all.each do |q|
		connection.exec("INSERT INTO fact_quotes (quote_id,date_created,company_name,email,nb_elevators) VALUES (#{q.id},#{q.create_at}, #{q.companyName}, #{q.email}, #{q.shaft})")
	end
	
	connection.exec("TRUNCATE fact_contact RESTART IDENTITY")
	Lead.all.each do |l|
		connection.exec("INSERT INTO fact_contact (contact_id,date_created,email,project_name) VALUES (#{l.id},#{l.create_at}, #{l.email}, #{l.projectName})")
	end
	
	connection.exec("TRUNCATE fact_elevator RESTART IDENTITY")
	Elevator.all.each do |e|
		connection.exec("INSERT INTO fact_elevator (serial_number,commissionning_date,building_id,customer_id, building_city) VALUES (#{e.serialNumber},#{e.installDate}, #{e.column.battery.building_id}, #{e.column.battery.building.customer_id},#{e.column.battery.building.address.city})")
	end
	
	connection.exec("TRUNCATE dim_customers RESTART IDENTITY")
	Customer.all.each do |c|
		count = 0
		c.building.all.each do |b|
			b.battery.all.each do |batt|
				batt.column.all.each do |col|
					col.elevator.all.each do |ele|
						count = count + 1
					end
				end
			end
		end
		connection.exec("INSERT INTO dim_customers (id,date_created,company_name,contact_name, contact_email,nb_elevators, customer_city) VALUES (#{c.id},#{c.create_at}, #{c.entrepriseName}, #{c.nameContact},#{c.email},count,#{c.address.city})")
	end
  end

end
