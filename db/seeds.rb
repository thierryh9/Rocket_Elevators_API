# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#------------------------- MYSQL -----------------------------------

Category.create(name: "standard",price: 7565.00,frais: 0.10)
Category.create(name: "premium",price: 12345.00,frais: 0.13)
Category.create(name: "excelium",price: 15400.00, frais: 0.16)
Type.create(name:"residential")
Type.create(name:"commercial")
Type.create(name:"corporate")
Type.create(name:"hybride")

 u1 = User.create(email: 'nicolas.genest@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: 1)
Employee.create(user: u1, email: 'nicolas.genest@codeboxx.biz', firstName: 'nicolas', lastName: 'genest', title: 'Comm Rep')
 u2 = User.create(email: 'nadya.fortier@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: 1)
Employee.create(user: u2, email: 'nadya.fortier@codeboxx.biz', firstName: 'Nadya', lastName: 'Fortier', title: 'Director')
 u3 = User.create(email: 'martin.chantal@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: 1)
Employee.create(user: u3, email: 'martin.chantal@codeboxx.biz', firstName: 'Martin', lastName: 'Chantal', title: 'Director Assistant')
 u4 = User.create(email: 'mathieu.houde@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: 1)
Employee.create(user: u4, email: 'mathieu.houde@codeboxx.biz', firstName: 'Mathieu', lastName: 'Houde', title: 'Captain')
 u5 = User.create(email: 'david.boutin@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: 1)
Employee.create(user: u5, email: 'david.boutin@codeboxx.biz', firstName: 'David', lastName: 'Boutin', title: 'Engineer')
 u6 = User.create(email: 'mathieu.lortie@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: 1)
Employee.create(user: u6, email: 'mathieu.lortie@codeboxx.biz', firstName: 'Mathieu', lastName: 'Lortie', title: 'Engineer')
 u7 = User.create(email: 'thomas.carrier@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: 1)
Employee.create(user: u7, email: 'thomas.carrier@codeboxx.biz', firstName: 'Thomas', lastName: 'Carrier', title: 'Engineer')

 u8 = User.create(email: 'normal@user.com', password: 'password', password_confirmation: 'password', admin: 0)
Employee.create(user: u8, email: 'normal@user.com', firstName: 'nobody', lastName: 'levesque', title: 'NormalUser')

300.times do
s = Faker::String.random(length: 3..12)
r = User.create(email: Faker::Internet.email, password: s, password_confirmation: s, admin: 0)
end

100.times do
Quote.create(companyName: Faker::Company.name, email: Faker::Internet.email,floor: rand(10),basement: rand(10),apartment: rand(10),business: rand(10),shaft: rand(10),parking: rand(10),companie: rand(10),ocupant: rand(10),open: rand(10), type: Type.offset(rand(Type.count)).first, category: Category.offset(rand(Category.count)).first)
end

csvFile = CSV.read("db/address.csv", :headers => true)
#puts csvFile[0]["first_name"]
ee = ["Building", "Customer"]
aa = ["Billing", "Shipping", "Home", "Business"]
100.times do |n|
 u = User.create(email: csvFile[n]["email"], password: 'password', password_confirmation: 'password', admin: 0)
 a = Address.create(aType: aa[rand(3)], status: "actif", entity: ee[1], street: csvFile[n]["address"], suite: "", city: csvFile[n]["city"], postalCode: csvFile[n]["postal"], country: csvFile[n]["province"], notes: Faker::Lorem)
 c = Customer.create(entrepriseName: csvFile[n]["company_name"], nameContact: csvFile[n]["first_name"], cellPhone: csvFile[n]["phone1"], email: csvFile[n]["email"], description: "", authorityName: csvFile[n]["first_name"], authorityPhone: csvFile[n]["phone2"], authorityEmail: csvFile[n]["email"], user: u, address: a)
 a1 = Address.create(aType: aa[3], status: "actif", entity: ee[0], street: csvFile[499-n]["address"], suite: "", city: csvFile[499-n]["city"], postalCode: csvFile[499-n]["postal"], country: csvFile[499-n]["province"], notes: Faker::Lorem)
 bb = Building.create(fullName: csvFile[499-n]["first_name"],email: csvFile[499-n]["email"],cellPhone: csvFile[499-n]["phone1"], techName: csvFile[499-n]["first_name"],techPhone: csvFile[499-n]["phone2"],techEmail: csvFile[499-n]["email"], address: a1, customer: c)
 b_details = BuildingDetail.create(infoKey: Faker::Lorem, infoValue: Faker::Lorem, building: bb)
 batterie = Battery.create(installDate: Faker::Date.between(from: '2019-09-23', to: '2020-01-25'),inspectionDate: Faker::Date.between(from: '2019-09-23', to: '2020-01-25'), status: rand(1), information: Faker::Lorem, note: Faker::Lorem, type: Type.offset(rand(Type.count)).first, employee: Employee.offset(rand(Employee.count)).first, building: bb)
 rand(2).times do |x|
	#column
	col = Column.create(numberFloor: rand(100),status: rand(1),information: Faker::Lorem, note: Faker::Lorem, battery: batterie)
	rand(4).times do
		#elevator
		elevator = Elevator.create(serialNumber: Faker::Device.serial,installDate: Faker::Date.between(from: '2019-09-23', to: '2020-01-25'),inspectionDate: Faker::Date.between(from: '2019-09-23', to: '2020-01-25'),status: rand(1),certificat: Faker::Device.serial,information: Faker::Lorem, note: Faker::Lorem, column: col, category: Category.offset(rand(Category.count)).first)
	end
 end
end
#------------------------- POSTGRESQL -----------------------------------

connection = PG.connect(dbname: 'allo',host: 'localhost', user: 'alex', password: 'alex')
sql = File.open('db/postgres.sql', 'rb') { |file| file.read }
connection.exec(sql)