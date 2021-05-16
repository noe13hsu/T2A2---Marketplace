# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

noe = User.create! :first_name => "Noe", :last_name => "Hsu", :email => "noe@gmail.com", :password => "Noe111!", :password_confirmation => "Noe111!", :location => "4109"
jin = User.create! :first_name => "Jin", :last_name => "Hsu", :email => "jin@gmail.com", :password => "Jin111!", :password_confirmation => "Jin111!", :location=> "4109"


noe.products.create(name: "Nioh", price: 5.0, condition: "used", console: "PS4")
noe.products.create(name: "Monster Hunter: World", price: 10.0, condition: "used", console: "PS4")
noe.products.create(name: "NBA2K20", price: 10.0, condition: "used", console: "PS5")
noe.products.create(name: "Nioh", price: 5.0, condition: "used", console: "Switch")
noe.products.create(name: "Monster Hunter: World", price: 10.0, condition: "used", console: "XBox One")
noe.products.create(name: "NBA2K20", price: 10.0, condition: "used", console: "PS5")
noe.products.create(name: "Nioh", price: 5.0, condition: "used", console: "Switch")
noe.products.create(name: "Monster Hunter: World", price: 10.0, condition: "used", console: "XBox One")
noe.products.create(name: "NBA2K20", price: 10.0, condition: "used", console: "Switch")
noe.products.create(name: "Monster Hunter: World", price: 10.0, condition: "used", console: "XBox One")
noe.products.create(name: "NBA2K20", price: 10.0, condition: "used", console: "PS5")
noe.products.create(name: "Nioh", price: 5.0, condition: "used", console: "Switch")
noe.products.create(name: "Monster Hunter: World", price: 10.0, condition: "used", console: "XBox One")
noe.products.create(name: "NBA2K20", price: 10.0, condition: "used", console: "Switch")
noe.products.create(name: "NBA2K20", price: 10.0, condition: "used", console: "Switch")
noe.products.create(name: "Monster Hunter: World", price: 10.0, condition: "used", console: "XBox One")
noe.products.create(name: "NBA2K20", price: 10.0, condition: "used", console: "PS5")
noe.products.create(name: "Nioh", price: 5.0, condition: "used", console: "Switch")
noe.products.create(name: "Monster Hunter: World", price: 10.0, condition: "used", console: "XBox One")
noe.products.create(name: "NBA2K20", price: 10.0, condition: "used", console: "Switch")

jin.products.create(name: "Persona 5", price: 10.0, condition: "used", console: "PS4")
jin.products.create(name: "Monster Hunter: Rise", price: 10.0, condition: "used", console: "Switch")
jin.products.create(name: "Persona 5", price: 10.0, condition: "used", console: "Switch")
jin.products.create(name: "Monster Hunter: Rise", price: 10.0, condition: "used", console: "PS5")
jin.products.create(name: "Persona 5", price: 10.0, condition: "used", console: "PS4")
jin.products.create(name: "Monster Hunter: Rise", price: 10.0, condition: "used", console: "XBox One")
jin.products.create(name: "Persona 5", price: 10.0, condition: "used", console: "Switch")
jin.products.create(name: "Monster Hunter: Rise", price: 10.0, condition: "used", console: "Switch")
jin.products.create(name: "Persona 5", price: 10.0, condition: "used", console: "PS5")
jin.products.create(name: "Monster Hunter: Rise", price: 10.0, condition: "used", console: "XBox One")
jin.products.create(name: "Monster Hunter: Rise", price: 10.0, condition: "used", console: "Switch")
jin.products.create(name: "Persona 5", price: 10.0, condition: "used", console: "Switch")
jin.products.create(name: "Monster Hunter: Rise", price: 10.0, condition: "used", console: "PS5")
jin.products.create(name: "Persona 5", price: 10.0, condition: "used", console: "PS4")
jin.products.create(name: "Monster Hunter: Rise", price: 10.0, condition: "used", console: "XBox One")
jin.products.create(name: "Persona 5", price: 10.0, condition: "used", console: "Switch")
jin.products.create(name: "Monster Hunter: Rise", price: 10.0, condition: "used", console: "Switch")
jin.products.create(name: "Persona 5", price: 10.0, condition: "used", console: "PS5")
jin.products.create(name: "Monster Hunter: Rise", price: 10.0, condition: "used", console: "XBox One")

