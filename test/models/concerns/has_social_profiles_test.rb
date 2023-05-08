require 'test_helper'

class HasSocialProfilesTest < ActiveSupport::TestCase
  class Model
    include ActiveModel

    attr_accessor :github, :twitter

    def save
      normalize_github
      normalize_twitter
    end

    def self.before_save(method, options); end

    include HasSocialProfiles
  end

  def setup
    @model = Model.new
  end

  test 'normalizes GitHub handle' do
    expected = 'troyizzle'
    @model.github = 'troyizzle'
    save_and_assert_normalized_handle(:github, expected)

    @model.github = 'http://github.com/troyizzle'
    save_and_assert_normalized_handle(:github, expected)

    @model.github = 'https://github.com/troyizzle'
    save_and_assert_normalized_handle(:github, expected)

    @model.github = 'http://www.github.com/troyizzle'
    save_and_assert_normalized_handle(:github, expected)

    @model.github = 'https://www.github.com/troyizzle'
    save_and_assert_normalized_handle(:github, expected)
  end

  test 'normalizes Twitter handle' do
    expected = 'troyizzle'
    @model.twitter = 'troyizzle'
    save_and_assert_normalized_handle(:twitter, expected)

    @model.twitter = 'http://twitter.com/troyizzle'
    save_and_assert_normalized_handle(:twitter, expected)

    @model.twitter = 'https://twitter.com/troyizzle'
    save_and_assert_normalized_handle(:twitter, expected)

    @model.twitter = 'http://www.twitter.com/troyizzle'
    save_and_assert_normalized_handle(:twitter, expected)

    @model.twitter = 'https://www.twitter.com/troyizzle'
    save_and_assert_normalized_handle(:twitter, expected)
  end

  def save_and_assert_normalized_handle(platform, expected)
    @model.save
    assert_equal expected, @model.send(platform)
  end
end
