class ProfilesController < ApplicationController


  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      create_new_tags(@user)
      redirect_to profile_path(@profile), notice: 'User was successfully created.'
    else
      render :new, status: 422
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
    params.require(:profile).permit(:name, :bio, :profile_picture, tag_ids: [])
  end

  def create_new_tags(taggable)
    if params[:user][:new_tags].present?
      params[:user][:new_tags].split(',').each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name.strip)
        taggable.tags << tag unless taggable.tags.include?(tag)
      end
    end
  end
end
