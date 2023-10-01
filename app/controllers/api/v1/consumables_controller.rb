class Api::V1::ConsumablesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :set_consumable, only: %i[ show update destroy ]

  def index
    @consumables = Consumable.all
    render json: ConsumableSerializer.new(@consumables).serializable_hash[:data].map{|hash| hash[:attributes]}, status: :ok
  end

  def show
    render json: ConsumableSerializer.new(@consumable).serializable_hash[:data][:attributes], status: :ok
  end

  def create
    @consumable = Consumable.create!(consumable_params)
    render json: ConsumableSerializer.new(@consumable).serializable_hash[:data][:attributes], status: :created
  end

  def update
    @consumable.update(consumable_params)
    render json: ConsumableSerializer.new(@consumable).serializable_hash[:data][:attributes], status: :ok
  end

  def destroy
    @consumable.destroy
    render json: {message: "Consumable deleted successfully"}, status: :ok
  end

  private

    def set_consumable
      @consumable = Consumable.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Consumable not found" }, status: :not_found
    end

    def consumable_params
      params.require(:consumable).permit(:form, :unit_of_measurement)
    end
end
