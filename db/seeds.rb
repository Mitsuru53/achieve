
n = 1
while n <= 100
  title = Faker::Name.title
  content = Faker::StarWars.quote
  user_id = n
  Blog.create(title: title, content: content,user_id: user_id)
  n += 1
end