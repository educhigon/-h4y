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
    if @health.update(profile_params)
      redirect_to health_data_path(@health), notice: 'Heatlh details saved.'
    else
      render :new, notice: "Please check the fields again"
    end
  end

  private

  def health_params
    params.require(:health_data).permit(:occupation, :gender, :country, :sleeping_hours, :age, :weight, :height, :bmi, :sun_exposure, :self_employed, :smoker, :alcohol_consumer, :active, :dairy_intake, :user_id)
  end

  def api_call_usertags
    require 'httparty'
    url = "https://mvp-nguajhe5yq-ew.a.run.app/categorize"
    response = HTTParty.get(url, headers: { 'Content-Type' => 'application/json' })

    if response.success?
    end
  end

  def test
    headers = {
      "method": "POST",
      "accept": "application/json",
      "Content-Type": "application/json",
    }
    body = {"occupation": "Student",
      "gender": "Male",
      "days_indoors": "1-14 days",
      "self_employed": "Yes",
      "smoking": "No",
      "alcohol_consumption": "Moderate",
      "sun_exposure": "Sufficient",
      "activity": "Active",
      "dairy_intake": "Low",
      "sleeping_hrs": "8",
      "age": 32,
      "weight": 67,
      "height": 163,
      "country": "United States"
    }
    url = "https://mvp-nguajhe5yq-ew.a.run.app/categorize"


    options = { "body" => body}
    response = HTTParty.get(url, options)

    p response.body, response.code, response.message, response.headers.inspect
  end
end
