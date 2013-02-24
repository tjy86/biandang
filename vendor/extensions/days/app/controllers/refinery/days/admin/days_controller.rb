module Refinery
  module Days
    module Admin
      class DaysController < ::Refinery::AdminController

        crudify :'refinery/days/day',
                :title_attribute => 'day', :xhr_paging => true

      end
    end
  end
end
