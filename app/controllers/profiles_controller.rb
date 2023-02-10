class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile
  # GET /profile/edit
  def edit
    @mode = params[:mode]
  end

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
    @profile = current_user.profile
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :date_of_birth)
  end
end
