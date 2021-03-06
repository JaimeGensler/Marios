class ReviewsController < ApplicationController
    before_action only: [:new, :create] do
        authorize(:user_auth)
    end
    before_action except: [:new, :create] do
        authorize(:admin_auth)
    end

    def new
        @product = Product.find(params[:product_id])
        @review = @product.reviews.new
        render :new
    end
    def create
        @product = Product.find(params[:product_id])
        new_params = review_params
        new_params[:user_id] = session[:user_id]
        @review = @product.reviews.new(new_params)
        if @review.save
            flash[:notice] = 'Successfully added review!'
            redirect_to product_path(@product)
        else
            render :new
        end
    end

    def show
        @product = Product.find(params[:product_id])
        @review = Review.find(params[:id])
        render :show
    end

    def edit
        @product = Product.find(params[:product_id])
        @review = Review.find(params[:id])
        render :edit
    end
    def update
        @product = Product.find(params[:product_id])
        @review = Review.find(params[:id])
        if @review.update(review_params)
            flash[:notice] = 'Successfully updated review!'
            redirect_to product_review_path(@product, @review)
        else
            render :edit
        end
    end

    def destroy
        Review.find(params[:id]).destroy
        flash[:alert] = 'Successfully deleted review.'
        redirect_to product_path(Product.find(params[:product_id]))
    end

    private
    def review_params
        params.require(:review).permit(:content_body, :rating)
    end
end
