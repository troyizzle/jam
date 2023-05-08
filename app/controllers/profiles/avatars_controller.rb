# frozen_string_literal: true

module Profiles
  class AvatarsController < ApplicationController
    before_action :set_profile

    def update
      respond_to do |format|
        if @profile.update(profile_params)
          format.turbo_stream { flash.now[:notice] = 'Avatar updated!' }
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
      params.require(:profile).permit(:avatar)
    end
  end
end
