class Api::V1::ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :set_product, only: %i[ show update destroy ]


  def index
    @products = Product.all
    render json: ProductSerializer.new(@products).serializable_hash[:data].map{|hash| hash[:attributes]}, status: :ok
  end

  def show
    render json: ProductSerializer.new(@product).serializable_hash[:data][:attributes], status: :ok
  end

  def create
    @product = Product.create!(product_params)
    render json: ProductSerializer.new(@product).serializable_hash[:data][:attributes], status: :created
  end

  def update
    @product.update(product_params)
    render json: ProductSerializer.new(@product).serializable_hash[:data][:attributes], status: :ok
  end

  def destroy
    @product.destroy
    render json: {message: "Product deleted successfully"}, status: :ok
  end


  private

    def set_product
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Product not found" }, status: :not_found
    end

    def product_params
      params.require(:product).permit(
        :name, :available, :productable_type, :productable_id,
        :unit_of_measurement, :cost_price, :selling_price, :reimbursable_amount
      )
    end

end
