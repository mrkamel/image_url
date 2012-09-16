
require "test/unit"
require File.expand_path("../../lib/image_url", __FILE__)

class TestRequest
  def protocol
    "http://"
  end

  def host_with_port
    "www.example.com"
  end 
end

class TestView
  include ActionView::Helpers::AssetTagHelper

  def request
    TestRequest.new
  end
end

ActionMailer::Base.default_url_options[:host] = "mailer.example.com"

class TestMailer < ActionMailer::Base
end

class TestMailerView
  include ActionView::Helpers::AssetTagHelper

  def initialize
    # As ActionMailer::Base.new is declared private, we have to use the send method
    # to create a mailer object.

    @controller = TestMailer.send(:new)
  end
end

class ImageUrlTest < Test::Unit::TestCase
  def setup
    ActionController::Base.asset_host = ""
  end

  def test_image_url
    assert_equal "http://www.example.com/images/image.png", TestView.new.image_url("/images/image.png")
  end

  def test_image_url_with_full_url
    assert_equal "http://www.test.com/images/image.png", TestView.new.image_url("http://www.test.com/images/image.png")
  end

  def test_image_url_with_asset_host
    ActionController::Base.asset_host = "http://assets.example.com"

    assert_equal "http://assets.example.com/images/image.png", TestView.new.image_url("/images/image.png")
  end

  def test_image_url_with_mailer
    assert_equal "http://mailer.example.com/images/image.png", TestMailerView.new.image_url("/images/image.png")
  end
end

