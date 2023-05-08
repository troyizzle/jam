# frozen_string_literal: true
class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  def show; end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.turbo_stream { flash.now[:notice] = 'Profile updated!' }
      else
        format.turbo_stream { render :update, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_profile
    @profile = Profile.find_by_hashid!(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio, :avatar, :date_of_birth, :github, :twitter)
  end
end
