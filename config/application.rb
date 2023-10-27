require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Karamimi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

#新規登録画面のレイアウトが崩れるのでfield_with_errorsを読み込まないよう設定
module FreemarketSample65d
  class Application < Rails::Application
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end
end