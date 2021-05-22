# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }]),
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

noe = User.create!(first_name: "Noe", last_name: "Hsu", email: "noe@gmail.com", password: "111111", password_confirmation: "111111", location: "4109")
jin = User.create!(first_name: "Jin", last_name: "Hsu", email: "jin@gmail.com", password: "111111", password_confirmation: "111111", location: "4109")
admin = User.create!(last_name: "Admin", email: "admin@gmail.com", password: "111111", password_confirmation: "111111", location: "4109")

admin.add_role :admin
jin.add_role :genuine

Cart.create!(user_id: noe.id)
Cart.create!(user_id: jin.id)
Cart.create!(user_id: admin.id)


noe.products.create(name: "Nioh", price: 5.5, condition: "used", console: "PS4")
noe.products.create(name: "Monster Hunter: World", price: 13.7, condition: "used", console: "PS4")
noe.products.create(name: "NBA2K20", price: 10.6, condition: "used", console: "PS5")
noe.products.create(name: "Nioh", price: 5.99, condition: "used", console: "Switch")
noe.products.create(name: "Monster Hunter: World", price: 12.5, condition: "used", console: "Xbox One")
noe.products.create(name: "NBA2K20", price: 15.3, condition: "used", console: "PS5")
noe.products.create(name: "Nioh", price: 5.8, condition: "used", console: "Switch")
noe.products.create(name: "Monster Hunter: World", price: 143.0, condition: "used", console: "Xbox One")
noe.products.create(name: "NBA2K20", price: 190.0, condition: "used", console: "Switch")
noe.products.create(name: "Monster Hunter: World", price: 1000.0, condition: "used", console: "Xbox X")
noe.products.create(name: "NBA2K20", price: 109.0, condition: "used", console: "PS5")
noe.products.create(name: "Nioh", price: 52.0, condition: "used", console: "Switch")
noe.products.create(name: "Monster Hunter: World", price: 120.0, condition: "used", console: "Xbox S")
noe.products.create(name: "NBA2K20", price: 103.0, condition: "used", console: "Switch")
noe.products.create(name: "NBA2K20", price: 100.0, condition: "used", console: "Switch")
noe.products.create(name: "Monster Hunter: World", price: 13.0, condition: "used", console: "Xbox X")
noe.products.create(name: "NBA2K20", price: 13.5, condition: "used", console: "PS5")
noe.products.create(name: "Nioh", price: 5.4, condition: "used", console: "Switch")
noe.products.create(name: "Monster Hunter: World", price: 17.8, condition: "used", console: "Xbox S")
noe.products.create(name: "NBA2K20", price: 10.4, condition: "used", console: "Switch")

jin.products.create(name: "Persona 5", price: 10.9, condition: "used", console: "PS4")
jin.products.create(name: "Monster Hunter: Rise", price: 1.5, condition: "used", console: "Switch")
jin.products.create(name: "Persona 5", price: 10.8, condition: "used", console: "Switch")
jin.products.create(name: "Monster Hunter: Rise", price: 21.0, condition: "used", console: "PS5")
jin.products.create(name: "Persona 5", price: 23.0, condition: "used", console: "PS4")
jin.products.create(name: "Monster Hunter: Rise", price: 30.0, condition: "used", console: "Xbox S")
jin.products.create(name: "Persona 5", price: 20.0, condition: "used", console: "Switch")
jin.products.create(name: "Monster Hunter: Rise", price: 19.0, condition: "used", console: "Switch")
jin.products.create(name: "Persona 5", price: 10.0, condition: "used", console: "PS5")
jin.products.create(name: "Monster Hunter: Rise", price: 18.0, condition: "used", console: "Xbox X")
jin.products.create(name: "Monster Hunter: Rise", price: 15.8, condition: "used", console: "Switch")
jin.products.create(name: "Persona 5", price: 14.5, condition: "used", console: "Switch")
jin.products.create(name: "Monster Hunter: Rise", price: 10.0, condition: "used", console: "PS5")
jin.products.create(name: "Persona 5", price: 11.0, condition: "used", console: "PS4")
jin.products.create(name: "Monster Hunter: Rise", price: 10.0, condition: "used", console: "Xbox One")
jin.products.create(name: "Persona 5", price: 17.0, condition: "used", console: "Switch")
jin.products.create(name: "Monster Hunter: Rise", price: 16.0, condition: "used", console: "Xbox S")
jin.products.create(name: "Persona 5", price: 18.0, condition: "used", console: "PS5")
jin.products.create(name: "Monster Hunter: Rise", price: 13.0, condition: "used", console: "Xbox One")

