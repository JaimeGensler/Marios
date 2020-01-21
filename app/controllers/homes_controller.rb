class HomesController < ApplicationController
    def index
        @blurb = Faker::Lorem.paragraph(sentence_count: 35, supplemental: true)
        render :index
    end
end
