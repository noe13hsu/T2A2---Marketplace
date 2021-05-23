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
kai = User.create!(first_name: "Kai", last_name: "Nagashima", email: "kai@gmail.com", password: "111111", password_confirmation: "111111", location: "4109")
admin = User.create!(last_name: "Admin", email: "admin@gmail.com", password: "111111", password_confirmation: "111111", location: "4109")

admin.add_role :admin
jin.add_role :genuine
kai.add_role :genuine

Cart.create!(user_id: noe.id)
Cart.create!(user_id: jin.id)
Cart.create!(user_id: kai.id)
Cart.create!(user_id: admin.id)


noe.products.create(name: "Nioh 2", price: 5.5, condition: "Used", console: "PlayStation 4")
noe.products.create(name: "The Witcher 3: Wild Hunt Game of the Year Edition", price: 13.7, condition: "Used", console: "PlayStation 4")
noe.products.create(name: "NBA2K20", price: 10.6, condition: "Used", console: "PlayStation 5")
noe.products.create(name: "Nioh", price: 5.99, condition: "Used", console: "Nintendo Switch")
noe.products.create(name: "Shin Megami Tensei III: Nocturne HD Remaster", price: 12.5, condition: "Used", console: "Xbox One")
noe.products.create(name: "The Last of Us Part II", price: 15.3, condition: "Used", console: "PlayStation 5")
noe.products.create(name: "A.O.T 2: Final Battle", price: 5.8, condition: "Used", console: "Nintendo Switch")
noe.products.create(name: "Monster Hunter: World", price: 143.0, condition: "Used", console: "PC")
noe.products.create(name: "Resident Evil 4", price: 190.0, condition: "Used", console: "Nintendo Switch")
noe.products.create(name: "Mass Effect: Andromeda", price: 1000.0, condition: "Used", console: "Xbox X/S")
noe.products.create(name: "Ghost of Tsushima", price: 109.0, condition: "Used", console: "PlayStation 5")

kai.products.create(name: "Metro Exodus", price: 52.0, condition: "Used", console: "Nintendo Switch")
kai.products.create(name: "Cyberpunk 2077", price: 120.0, condition: "Used", console: "Xbox X/S")
kai.products.create(name: "Gran Turismo Sport", price: 103.0, condition: "Used", console: "Nintendo Switch")
kai.products.create(name: "NBA2K20", price: 100.0, condition: "Used", console: "Nintendo Wii")
kai.products.create(name: "Dragon Ball Z: Kakarot", price: 13.0, condition: "Used", console: "Xbox X/S")
kai.products.create(name: "WWE 2K19", price: 13.5, condition: "Used", console: "PlayStation 5")
kai.products.create(name: "Nioh", price: 5.4, condition: "Used", console: "Nintendo Switch")
kai.products.create(name: "Overwatch", price: 17.8, condition: "Used", console: "Xbox X/S")
kai.products.create(name: "NBA2K18", price: 10.4, condition: "Used", console: "Nintendo Switch")
kai.products.create(name: "WWE 2K19", price: 10.9, condition: "Used", console: "PlayStation 4")
kai.products.create(name: "Life is Strange", price: 1.5, condition: "Used", console: "Nintendo Switch")
kai.products.create(name: "Dragon Ball Z: Kakarot", price: 10.8, condition: "Used", console: "Nintendo Wii")
kai.products.create(name: "Monster Hunter: Rise", price: 21.0, condition: "Used", console: "PlayStation 5")
kai.products.create(name: "Cyberpunk 2077", price: 23.0, condition: "Used", console: "PlayStation 4")
kai.products.create(name: "Grand Theft Auto V", price: 30.0, condition: "Used", console: "Xbox X/S")

jin.products.create(name: "Persona 4", price: 20.0, condition: "Used", console: "PC")
jin.products.create(name: "Far Cry 5", price: 19.0, condition: "Used", console: "Nintendo Switch")
jin.products.create(name: "Overwatch", price: 10.0, condition: "Used", console: "PlayStation 5")
jin.products.create(name: "Mortal Kombat 11", price: 18.0, condition: "Used", console: "Xbox X/S")
jin.products.create(name: "Monster Hunter: Rise", price: 15.8, condition: "Used", console: "Nintendo Wii U")
jin.products.create(name: "Daymare 1998", price: 14.5, condition: "Used", console: "Nintendo Switch")
jin.products.create(name: "Nier: Automata", price: 10.0, condition: "Used", console: "PlayStation 5")
jin.products.create(name: "The Last of Us Part II", price: 11.0, condition: "Used", console: "PlayStation 4")
jin.products.create(name: "Borderlands 3", price: 10.0, condition: "Used", console: "Xbox One")
jin.products.create(name: "Gran Turismo Sport", price: 17.0, condition: "Used", console: "Nintendo Switch")
jin.products.create(name: "Nioh", price: 16.0, condition: "Used", console: "PlayStation 3")
jin.products.create(name: "Persona 5", price: 18.0, condition: "Used", console: "PlayStation 5")
jin.products.create(name: "FIFA 21", price: 13.0, condition: "Used", console: "Xbox One")

