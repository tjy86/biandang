module Refinery
  module Menus
    module Admin
      class MenusController < ::Refinery::AdminController

        crudify :'refinery/menus/menu',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end