
require "image_url/version"
require "active_support"
require "action_mailer"
require "action_view"

module ActionView
  module Helpers
    module AssetTagHelper
      def image_url(*args)
        path = image_path(*args)

        return path if path =~ /^https?:\/\//

        asset_host = nil

        if ActionController::Base.asset_host.blank?
          if @controller.is_a?(ActionMailer::Base)
            asset_host = "http://#{ActionMailer::Base.default_url_options[:host]}"
          else
            asset_host = "#{request.protocol}#{request.host_with_port}"
          end
        else
          asset_host = ActionController::Base.asset_host
        end

        "#{asset_host}#{path}"
      end
    end
  end
end

