class Api::V1::DrugsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :set_drug, only: %i[ show update destroy ]

  def index
    @drugs = Drug.all
    render json: DrugSerializer.new(@drugs).serializable_hash[:data].map{|hash| hash[:attributes]}, status: :ok
  end

  def show
    render json: DrugSerializer.new(@drug).serializable_hash[:data][:attributes], status: :ok
  end


  def create
    @drug = Drug.create!(drug_params)
    render json: DrugSerializer.new(@drug).serializable_hash[:data][:attributes], status: :created
  end


  def update
    @drug.update(drug_params)
    render json: DrugSerializer.new(@drug).serializable_hash[:data][:attributes], status: :ok
  end


  def destroy
    @drug.destroy
    render json: {message: "Drug deleted successfully"}, status: :ok
  end

  private

    def set_drug
      @drug = Drug.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Drug not found" }, status: :not_found
    end



    def drug_params
      params.require(:drug).permit(:category, :form, :unit_of_measurement)
    end
end
