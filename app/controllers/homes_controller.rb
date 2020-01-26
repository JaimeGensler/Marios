class HomesController < ApplicationController
    def index
        @recents = Product.most_recent
        @top = Product.most_reviews
        @usa = Product.by_country('United States of America')
        render :index
    end

    def about
        @blurb = Faker::Lorem.paragraph(sentence_count: 35, supplemental: true)
        render :about
    end
end
