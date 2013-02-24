module Refinery
  module Days
    class Day < Refinery::Core::BaseModel
      self.table_name = 'refinery_days'

      attr_accessible :day, :neighborhood, :location, :longitude, :latitude, :position

      acts_as_indexed :fields => [:day, :neighborhood, :location]

      validates :day, :presence => true, :uniqueness => true
    end
  end
end
