# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
Quote.create(floor: Random.new(10),basement: Random.new(10),apartment: Random.new(10),business: Random.new(20),shaft: Random.new(20),parking: Random.new(20),companie: Random.new(20),ocupant: Random.new(20),open: Random.new(20), type: Type.offset(rand(Type.count)).first, category: Category.offset(rand(Category.count)).first)
end
