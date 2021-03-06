# This migration comes from refinery_menus (originally 1)
class CreateMenusMenus < ActiveRecord::Migration

  def up
    create_table :refinery_menus do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-menus"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/menus/menus"})
    end

    drop_table :refinery_menus

  end

end
