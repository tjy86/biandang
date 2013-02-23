module Refinery
  module Days
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Days

      engine_name :refinery_days

      initializer "register refinerycms_days plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "days"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.days_admin_days_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/days/day',
            :title => 'day'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Days)
      end
    end
  end
end
