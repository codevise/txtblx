module Txtblx
  class Engine < ::Rails::Engine
    isolate_namespace Txtblx

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    initializer :txtblx_admin do
      ActiveAdmin.application.load_paths.unshift File.join(config.root, 'lib/txtblx/admin')
    end
  end
end
