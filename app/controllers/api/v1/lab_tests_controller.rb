class Api::V1::LabTestsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :set_lab_test, only: %i[ show update destroy ]


  def index
    @lab_tests = LabTest.all
    render json: LabTestSerializer.new(@lab_tests).serializable_hash[:data].map{|hash| hash[:attributes]}, status: :ok
  end

  def show
    render json: LabTestSerializer.new(@lab_test).serializable_hash[:data][:attributes], status: :ok
  end

  def create
    @lab_test = LabTest.create!(lab_test_params)
    render json: LabTestSerializer.new(@lab_test).serializable_hash[:data][:attributes], status: :created
  end

  def update
    @lab_test.update(lab_test_params)
    render json: LabTestSerializer.new(@lab_test).serializable_hash[:data][:attributes], status: :ok
  end

  def destroy
    @lab_test.destroy
    render json: {message: "laboratory test deleted successfully"}, status: :ok
  end


  private

    def set_lab_test
      @lab_test = LabTest.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "laboratory test not found" }, status: :not_found
    end

    def lab_test_params
      params.require(:lab_test).permit(:category, :unit_of_measurement, :min_ref_value, :max_ref_value)
    end
end
