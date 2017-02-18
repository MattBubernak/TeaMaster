class SteepInstructionsController < ApplicationController
  before_action :set_steep_instruction, only: [:show, :edit, :update, :destroy]

  # GET /steep_instructions
  # GET /steep_instructions.json
  def index
    @steep_instructions = SteepInstruction.all
  end

  # GET /steep_instructions/1
  # GET /steep_instructions/1.json
  def show
  end

  # GET /steep_instructions/new
  def new
    @steep_instruction = SteepInstruction.new
  end

  # GET /steep_instructions/1/edit
  def edit
  end

  # POST /steep_instructions
  # POST /steep_instructions.json
  def create
    @steep_instruction = SteepInstruction.new(steep_instruction_params)

    respond_to do |format|
      if @steep_instruction.save
        format.html { redirect_to @steep_instruction, notice: 'Steep instruction was successfully created.' }
        format.json { render :show, status: :created, location: @steep_instruction }
      else
        format.html { render :new }
        format.json { render json: @steep_instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steep_instructions/1
  # PATCH/PUT /steep_instructions/1.json
  def update
    respond_to do |format|
      if @steep_instruction.update(steep_instruction_params)
        format.html { redirect_to @steep_instruction, notice: 'Steep instruction was successfully updated.' }
        format.json { render :show, status: :ok, location: @steep_instruction }
      else
        format.html { render :edit }
        format.json { render json: @steep_instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steep_instructions/1
  # DELETE /steep_instructions/1.json
  def destroy
    @steep_instruction.destroy
    respond_to do |format|
      format.html { redirect_to steep_instructions_url, notice: 'Steep instruction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_steep_instruction
      @steep_instruction = SteepInstruction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def steep_instruction_params
      params.require(:steep_instruction).permit(:temperature, :time, :recipe_id)
    end
end
