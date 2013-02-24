class CreateDaysDays < ActiveRecord::Migration

  def up
    create_table :refinery_days do |t|
      t.string :day
      t.string :neighborhood
      t.string :location
      t.float :longitue
      t.float :latitude
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-days"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/days/days"})
    end

    drop_table :refinery_days

  end

end
