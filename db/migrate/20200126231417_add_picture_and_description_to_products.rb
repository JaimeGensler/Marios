class AddPictureAndDescriptionToProducts < ActiveRecord::Migration[5.2]
    def change
        add_column :products, :picture, :string
        add_column :products, :description, :string
    end
end
