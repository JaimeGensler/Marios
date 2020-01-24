class AddReviewAndUserAssociation < ActiveRecord::Migration[5.2]
    def change
        remove_column    :reviews,  :author
        add_column       :reviews,  :user_id,  :integer
        add_foreign_key  :reviews,  :users
    end
end
