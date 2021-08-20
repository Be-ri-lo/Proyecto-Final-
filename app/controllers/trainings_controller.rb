class TrainingsController < ApplicationController
  before_action :set_training, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user! 
  before_action :set_sports, :set_levels, :set_places, only: %i[new edit]  
  
  # GET /trainings or /trainings.json
  def index
    @training_group = Training.group(:user_id).count.transform_keys {|key| User.find(key).name}
    @training_sport = Training.group(:sport).count

    @trainings = Training.with_attached_images.all.order('date ASC').page(params[:page])
    @training = Training.new
  end

  # GET /trainings/1 or /trainings/1.json
  def show
    @training = Training.find(params[:id])
    @place = Place.new
  end

  # GET /trainings/new
  def new
    @training = current_user.trainings.build 
    @trainings = Training.all
  end

  # GET /trainings/1/edit
  def edit
  end

  # POST /trainings or /trainings.json
  def create
    @training = Training.new(training_params.merge(user: current_user)) #, place: :place_id
    respond_to do |format|
      if @training.save
        format.html { redirect_to @training, notice: "Training was successfully created." }
        format.json { render :show, status: :created, location: @training }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainings/1 or /trainings/1.json
  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to @training, notice: "Training was successfully updated." }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1 or /trainings/1.json
  def destroy
    @training.destroy
    respond_to do |format|
      format.html { redirect_to trainings_url, notice: "Training was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # def partners #pendiente para historia DUS003
  #   @partner = @user.partner.create(user_id: current_user.id, partner_id: @training.user.id)
  #   redirect_to root_path, notice: "Quiero entrenar contigo!"
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    def set_sports
      @sports = Training.sports.map { |sport, id| [sport, sport] }
    end

    def set_levels
      @levels = Training.levels.map { |level, id| [level, level] }
    end

    def set_places
      @places = Place.pluck :location, :id
    end
    
    def set_current_training
      @training = training.find(params[:training_id])
    end

    # Only allow a list of trusted parameters through.
    def training_params
      params.require(:training).permit(:name, :date, :sport, :level, :active, :place_id, :rating, images: []) #:user_id, :place_id)
    end
end
