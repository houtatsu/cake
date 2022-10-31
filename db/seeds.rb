Admin.create!(
    email: 'test@gmail.com',
    password: '20000404',
)

Customer.create!(
    {
      first_name: "名前",
      last_name: "苗字",
      first_name_kana: "ナマエ",
      last_name_kana: "ミョウジ",
      email: "test1@gmail.com",
      postal_code: "1111111",
      address: "test1県test1市",
      telephone_number: "11111111111",
      password: "111111",
    }
    )
    

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
