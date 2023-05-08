# frozen_string_literal: true

module Users
  class AvatarComponent < ViewComponent::Base
    SIZES = {
      'sm' => 'w-12 h-12',
      'md' => 'w-14 h-14',
      'lg' => 'w-40 h-40',
      'xl' => 'h-48 w-48',
    }.freeze

    def initialize(user:, size: 'sm', **args)
      @user = user
      @size = size
      @args = args
    end

    def classes
      "rounded-full object-fit #{SIZES[@size]}"
    end
  end
end
