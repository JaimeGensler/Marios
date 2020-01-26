class HomesController < ApplicationController
    def index
        @recents = Product.most_recent
        @top = Product.most_reviews
        @usa = Product.by_country('United States of America')
    end

    def about
        @quote = Faker::TvShows::BojackHorseman.quote
        @quote += (!/[?.!]\z/.match?(@quote) ? '.' : '')
    end
end
