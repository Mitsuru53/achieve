100.times do |n|
  email = Faker::Internet.email
  password = "password"
    name = Faker::Name.name
  User.create!(email: email,password: password, password_confirmation: password, name: name)
end

# 100.times do |n|
# n = 1
# while n <= 100
#   title = Faker::Name.title
#   content = Faker::StarWars.quote
#   user_id = n
#   Blog.create(title: title, content: content,user_id: user_id)
#   n += 1
# end