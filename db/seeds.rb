Product.destroy_all
Review.destroy_all

50.times do |i|
    Product.create!(
        name: Faker::Food.ingredient,
        cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        country_of_origin: Faker::Address.country
    )
end

bojack = Faker::TvShows::BojackHorseman
250.times do |i|
    Product.random.reviews.create!(
        author: bojack.character,
        content_body: "#{bojack.quote}. #{bojack.tongue_twister}".truncate(250),
        rating: (1 + rand(5))
    )
end

p "Created #{Product.count} products."
p "Created #{Review.count} reviews."
