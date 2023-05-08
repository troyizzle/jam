module HasSocialProfiles
  extend ActiveSupport::Concern

  PREFIXES = {
    github: 'github.com/',
    twitter: 'twitter.com/',
  }.freeze

  included do
    before_save :normalize_github, if: :will_save_change_to_github?
    before_save :normalize_twitter, if: :will_save_change_to_twitter?
  end

  private

  PREFIXES.each do |handle, prefix|
    define_method "normalize_#{handle}" do
      send(handle)&.delete_prefix!(prefix)
      send(handle)&.delete_prefix!("http://#{prefix}")
      send(handle)&.delete_prefix!("https://#{prefix}")
      send(handle)&.delete_prefix!("http://www.#{prefix}")
      send(handle)&.delete_prefix!("https://www.#{prefix}")
    end
  end
end
