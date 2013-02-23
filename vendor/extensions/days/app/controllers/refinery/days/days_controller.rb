module Refinery
  module Days
    class DaysController < ::ApplicationController

      before_filter :find_all_days
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @day in the line below:
        present(@page)
      end

      def show
        @day = Day.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @day in the line below:
        present(@page)
      end

    protected

      def find_all_days
        @days = Day.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/days").first
      end

    end
  end
end
