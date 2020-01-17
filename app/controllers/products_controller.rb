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
        redirect_to products_path if @product.save
        render :new
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
        redirect_to product_path(@product) if @product.update(product_params)
        render :edit
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path
    end

    private
    def product_params
        params.require(:album).permit(:name, :cost, :country_of_origin)
    end
end
