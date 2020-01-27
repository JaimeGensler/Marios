Product.destroy_all
Review.destroy_all
User.destroy_all

bojack = Faker::TvShows::BojackHorseman
40.times do |i|
    User.create!(
        username: "#{bojack.character}#{i}",
        email: "example#{i}@example.com",
        password: 'password'
    )
end

50.times do |i|
    name = Faker::Food.dish
    Product.create!(
        name: name,
        description: Faker::Food.description,
        cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        country_of_origin: Faker::Address.country
    )
end

250.times do |i|
    User.random.reviews.create!(
        product_id: Product.random.id,
        content_body: "#{bojack.quote}. #{bojack.tongue_twister}".truncate(250),
        rating: (1 + rand(5))
    )
end

#admin creation only occurs here
User.create!(username: 'admin', email: 'admin', password: 'admin', admin: true)

p "Created #{Product.count} products."
p "Created #{Review.count} reviews."
p "Created #{User.count} users."
