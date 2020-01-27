class RemovePicturesFromProducts < ActiveRecord::Migration[5.2]
    def change
        remove_column    :products,  :picture
    end
end
