# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create({name: "standard",price: 7565.00,frais: 0.10},{name: "premium",price: 12345.00,frais: 0.13},{name: "excelium",price: 15400.00, frais: 0.16})
Type.create({name:"residential"},{name:"commercial"},{name:"corporate"},{name:"hybride"},{name:"hybride"})
