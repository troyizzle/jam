# frozen_string_literal: true

module Users
  class AvatarComponent < ViewComponent::Base
    SIZES = {
      'sm' => 'w-10 h-10',
      'xl' => 'h-48 w-48'
    }.freeze

    def initialize(avatar_url:, size: "sm")
      @avatar_url = avatar_url
      @size = size
    end

    def classes
      "rounded-full object-fit #{SIZES[@size]}"
    end

    def avatar_url
      return @avatar_url if @avatar_url

      'https://cdn-icons-png.flaticon.com/512/149/149071.png'
    end
  end
end
