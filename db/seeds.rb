# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Usuario.create!(nome: 'Fulano',
                email: 'fulano@example.com',
                password: '123456',
                password_confirmation: '123456')

Usuario.create!(nome: 'Beltrano',
                email: 'beltrano@example.com',
                password: '123456',
                password_confirmation: '123456')

AgenciaBancaria.create!(numero: 12,
                        endereco: 'Avenida 13 de Maio, 159')

AgenciaBancaria.create!(numero: 18,
                        endereco: 'Avenida Mr Hull, 458')

ContaBancaria.create!(numero: 123,
                      limite: 500,
                      numero_agencia: 12)

ContaBancaria.create!(numero: 456,
                      limite: 500,
                      numero_agencia: 18)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')