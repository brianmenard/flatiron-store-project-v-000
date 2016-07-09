10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end


emails_for_user = ["example@something.com", "whatever@fake.com", "somethingelse@blah.com"]

emails_for_user.each do |email|
  User.create(email: email, password: "password1", password_confirmation: "password1")
end
