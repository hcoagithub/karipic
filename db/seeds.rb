
admin = User.create(email: "karipic@gmail.com", password: "123456","password_confirmation": "123456", name:"kari", role: "admin")

i = 1
until User.count == 20 do
    User.create(email: Faker::Internet.email, password: "12345#{i}","password_confirmation": "12345#{i}", name:Faker::Name.name)
    i += 1
end


j = 0
until Publication.count == 100 do
    Publication.create(description: Faker::Lorem.paragraph, user_id: rand(0...User.count))
    j += 1
end
