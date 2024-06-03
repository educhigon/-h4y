class HealthDataController < ApplicationController

  def create
    @health = HealthDatum.new(post_params)
    if @health.save
      redirect_to health_data_path(@health), notice: 'Heatlh details saved.'
    else
      render :new, notice: "Please check the fields again"
    end
  end

  def new
    @health = HealthDatum.new
  end

  def show
    @health = HealthDatum.where(user_id: current_user.id).first
  end

  def edit
    @health = HealthDatum.where(user_id: current_user.id).first
  end

  def update
    @health = HealthDatum.where(user_id: current_user.id).first
    if @health.update(health_params)
      redirect_to health_datum_path(@health), notice: 'Health details saved.'
    else
      render :new, notice: "Please check the fields again"
    end
  end

  private

  def health_params
    params.require(:health_datum).permit(:occupation, :gender, :country, :sleeping_hours, :age, :weight, :height, :bmi, :sun_exposure, :self_employed, :smoker, :alcohol_consumer, :active, :dairy_intake, :user_id)
  end

end
