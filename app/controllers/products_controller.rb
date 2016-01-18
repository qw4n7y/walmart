class ProductsController < ApplicationController

  before_filter :fetch_products

  def index
    @products = Product.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(permitted_params)
    if @product.save
      redirect_to products_path, notice: "Reviews were fetched"
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  protected

  def fetch_products
    
  end

  def permitted_params
    params.require(:product).permit(:product_id, :freetext)
  end
end
