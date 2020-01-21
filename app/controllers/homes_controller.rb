class HomesController < ApplicationController
    def index
        @blurb = Faker::Lorem.paragraph(sentence_count: 35, supplemental: true)
        @recents = Product.most_recent
        @top = Product.most_reviews
        @usa = Product.by_country('United States of America')
        render :index
    end
end
