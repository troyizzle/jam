# frozen_string_literal: true

module Profiles
  class CoverImagesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_profile

    def update
      respond_to do |format|
        if @profile.update(profile_params)
          format.turbo_stream { flash.now[:notice] = 'Cover image updated!' }
        else
          format.turbo_stream { render :update, status: :unprocessable_entity }
        end
      end
    end

    private

    def set_profile
      @profile = current_user.profile
    end

    def profile_params
      params.require(:profile).permit(:cover_image)
    end
  end
end
