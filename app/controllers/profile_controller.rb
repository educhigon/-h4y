class ProfileController < ApplicationController

  def show
    @profile = Profile.new
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end


  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :new, status: 422
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :bio, :profile_picture)
  end

end
