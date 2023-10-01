class Api::V1::InsuranceProvidersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :set_insurance_provider, only: %i[ show update destroy ]

  def index
    @insurance_providers = InsuranceProvider.all
    render json: InsuranceProviderSerializer.new(@insurance_providers).serializable_hash[:data].map{|hash| hash[:attributes]}, status: :ok
  end

  def show
    render json: InsuranceProviderSerializer.new(@insurance_provider).serializable_hash[:data][:attributes], status: :ok
  end

  def create
    @insurance_provider = InsuranceProvider.create!(insurance_provider_params)
    render json: InsuranceProviderSerializer.new(@insurance_provider).serializable_hash[:data][:attributes], status: :created
  end

  def update
    @insurance_provider.update(insurance_provider_params)
    render json: InsuranceProviderSerializer.new(@insurance_provider).serializable_hash[:data][:attributes], status: :ok
  end

  def destroy
    @insurance_provider.destroy
    render json: {message: "Insurance provider deleted successfully"}, status: :ok
  end

  private

    def set_insurance_provider
      @insurance_provider = InsuranceProvider.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "InsuranceProvider not found" }, status: :not_found
    end

    def insurance_provider_params
      params.require(:insurance_provider).permit(:name, :email, :address, :city, :province_or_state, :country)
    end
end
