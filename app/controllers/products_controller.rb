class ProductsController < ApplicationController
    def index
        @products = Product.all
        render :index
    end

    def new
        @product = Product.new
        render :new
    end
    def create
        @product = Product.new(product_params)
        if @product.save
            flash[:notice] = 'Successfully added new product!'
            redirect_to products_path
        else
            render :new
        end
    end

    def show
        @product = Product.find(params[:id])
        render :show
    end

    def edit
        @product = Product.find(params[:id])
        render :edit
    end
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            flash[:notice] = 'Successfully updated product!'
            redirect_to product_path(@product)
        else
            render :edit
        end
    end

    def destroy
        Product.find(params[:id]).destroy
        flash[:alert] = 'Successfully deleted product.'
        redirect_to products_path
    end

    private
    def product_params
        params.require(:product).permit(:name, :cost, :country_of_origin)
    end
end
