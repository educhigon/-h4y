class HealthDataController < ApplicationController
    def show
      @health = HealthDatum.where(user_id: current_user.id).first
    end

  def new
    @health = HealthDatum.new
  end

  def create
    @health = HealthDatum.new(health_params)
    @health.user_id = current_user.id
    # raise
    if @health.save
      redirect_to health_datum_path(@health), notice: 'Heatlh details saved.'
    else
      # render :new, notice: "Please check the fields again"
      render :new, status: 422
    end
  end

  def edit
    @health = HealthDatum.where(user_id: current_user.id).first
  end

  def update
    @health = HealthDatum.where(user_id: current_user.id).first
    if @health.update(health_params)
      # raise
      @xx = health_params
      # raise

      redirect_to health_datum_path(@health), notice: 'Health details saved.'
    else
      render :new, status: 422
    end
  end

  private

  def health_params
    params.require(:health_datum).permit(
      :gender, :country, :occupation, :days_indoors, :self_employed,
      :smoker, :alcohol_consumer, :sun_exposure, :active, :dairy_intake,
      :sleeping_hours, :age, :weight, :height, :user_id)

      # :occupation, :gender, :country, :sleeping_hours, :age,
      # :weight, :height, :bmi, :sun_exposure, :self_employed,
      # :smoker, :alcohol_consumer, :active, :dairy_intake, :user_id)
  end
end
