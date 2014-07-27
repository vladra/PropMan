class SuersController < ApplicationController
  before_action :set_suer, only: [:show, :edit, :update, :destroy]

  # GET /suers
  # GET /suers.json
  def index
    @suers = Suer.all
  end

  # GET /suers/1
  # GET /suers/1.json
  def show
  end

  # GET /suers/new
  def new
    @suer = Suer.new
  end

  # GET /suers/1/edit
  def edit
  end

  # POST /suers
  # POST /suers.json
  def create
    @suer = Suer.new(suer_params)

    respond_to do |format|
      if @suer.save
        format.html { redirect_to @suer, notice: 'Suer was successfully created.' }
        format.json { render :show, status: :created, location: @suer }
      else
        format.html { render :new }
        format.json { render json: @suer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suers/1
  # PATCH/PUT /suers/1.json
  def update
    respond_to do |format|
      if @suer.update(suer_params)
        format.html { redirect_to @suer, notice: 'Suer was successfully updated.' }
        format.json { render :show, status: :ok, location: @suer }
      else
        format.html { render :edit }
        format.json { render json: @suer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suers/1
  # DELETE /suers/1.json
  def destroy
    @suer.destroy
    respond_to do |format|
      format.html { redirect_to suers_url, notice: 'Suer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suer
      @suer = Suer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suer_params
      params.require(:suer).permit(:name, :email, :login)
    end
end
