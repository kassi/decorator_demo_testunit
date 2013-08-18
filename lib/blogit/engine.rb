module Blogit
  class Engine < ::Rails::Engine
    isolate_namespace Blogit

    config.to_prepare do
      Dir.glob(Rails.root + "app/decorators/**/blogit/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
    end
  end
end
