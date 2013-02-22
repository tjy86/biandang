module Refinery
  module Menus
    class Menu < Refinery::Core::BaseModel
      self.table_name = 'refinery_menus'

      attr_accessible :name, :price, :description, :photo_id, :position

      acts_as_indexed :fields => [:name, :description]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
