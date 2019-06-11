class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]

  def show
    @user_data = Profile.where(user_id: current_user)
    #@attributes = Profile.attribute_names - %w(id user_id created_at updated_at)
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :age)
  end
end
