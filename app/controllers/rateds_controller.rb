class RatedsController < ApplicationController
  before_action :set_rated, only: %i[ show edit update destroy ]

  # GET /rateds or /rateds.json
  def index
    @rateds = Rated.all
  end

  # GET /rateds/1 or /rateds/1.json
  def show
  end

  # GET /rateds/new
  def new
    @rated = Rated.new
  end

  # GET /rateds/1/edit
  def edit
  end

  # POST /rateds or /rateds.json
  def create
    @rated = Rated.new(rated_params)
    @rated.user_id = current_user.id

    respond_to do |format|
      if @rated.save
        format.html { redirect_to @rated, notice: "Rated was successfully created." }
        format.json { render :show, status: :created, location: @rated }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rated.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rateds/1 or /rateds/1.json
  def update
    respond_to do |format|
      if @rated.update(rated_params)
        format.html { redirect_to @rated, notice: "Rated was successfully updated." }
        format.json { render :show, status: :ok, location: @rated }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rated.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rateds/1 or /rateds/1.json
  def destroy
    @rated.destroy
    respond_to do |format|
      format.html { redirect_to rateds_url, notice: "Rated was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rated
      @rated = Rated.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rated_params
      params.require(:rated).permit(:value, :content)
    end
end
