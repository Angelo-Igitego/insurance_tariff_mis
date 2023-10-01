class Api::V1::MedicalActsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :set_medical_act, only: %i[ show update destroy ]


  def index
    @medical_acts = MedicalAct.all
    render json: MedicalActSerializer.new(@medical_acts).serializable_hash[:data].map{|hash| hash[:attributes]}, status: :ok
  end

  def show
    render json: MedicalActSerializer.new(@medical_act).serializable_hash[:data][:attributes], status: :ok
  end

  def create
    @medical_act = MedicalAct.create!(medical_act_params)
    render json: MedicalActSerializer.new(@medical_act).serializable_hash[:data][:attributes], status: :created
  end

  def update
    @medical_act.update(medical_act_params)
    render json: MedicalActSerializer.new(@medical_act).serializable_hash[:data][:attributes], status: :ok
  end

  def destroy
    @medical_act.destroy
    render json: {message: "Medical act deleted successfully"}, status: :ok
  end


  private

    def set_medical_act
      @medical_act = MedicalAct.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Medical act not found" }, status: :not_found
    end

    def medical_act_params
      params.require(:medical_act).permit(:name, :description)
    end
end
