class MedicalActsController < ApplicationController
  before_action :set_medical_act, only: %i[ show edit update destroy ]

  # GET /medical_acts or /medical_acts.json
  def index
    @medical_acts = MedicalAct.all
  end

  # GET /medical_acts/1 or /medical_acts/1.json
  def show
  end

  # GET /medical_acts/new
  def new
    @medical_act = MedicalAct.new
  end

  # GET /medical_acts/1/edit
  def edit
  end

  # POST /medical_acts or /medical_acts.json
  def create
    @medical_act = MedicalAct.new(medical_act_params)

    respond_to do |format|
      if @medical_act.save
        format.html { redirect_to medical_act_url(@medical_act), notice: "Medical act was successfully created." }
        format.json { render :show, status: :created, location: @medical_act }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medical_act.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_acts/1 or /medical_acts/1.json
  def update
    respond_to do |format|
      if @medical_act.update(medical_act_params)
        format.html { redirect_to medical_act_url(@medical_act), notice: "Medical act was successfully updated." }
        format.json { render :show, status: :ok, location: @medical_act }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medical_act.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_acts/1 or /medical_acts/1.json
  def destroy
    @medical_act.destroy

    respond_to do |format|
      format.html { redirect_to medical_acts_url, notice: "Medical act was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_act
      @medical_act = MedicalAct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medical_act_params
      params.require(:medical_act).permit(:name, :description)
    end
end
