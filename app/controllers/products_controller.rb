class ProductsController < ApplicationController
  include ProductHelper

  def index
    
    @products = if params[:category_id].present?
                  Category.find(params[:category_id]).products
                else
                  Product.all
                end

    # Filter by search keyword if provided
    if params[:search].present?
      @products = @products.where("name LIKE :search OR description LIKE :search", search: "%#{params[:search]}%")
    end

    # Continue with the existing ordering and pagination
    @products = @products.order(created_at: :desc).page(params[:page]).per(6)
  end

  def show
    @product = Product.find(params[:id])
  end

end
