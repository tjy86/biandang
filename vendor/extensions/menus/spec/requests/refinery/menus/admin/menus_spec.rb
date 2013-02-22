# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Menus" do
    describe "Admin" do
      describe "menus" do
        login_refinery_user

        describe "menus list" do
          before do
            FactoryGirl.create(:menu, :name => "UniqueTitleOne")
            FactoryGirl.create(:menu, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.menus_admin_menus_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.menus_admin_menus_path

            click_link "Add New Menu"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Menus::Menu.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Menus::Menu.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:menu, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.menus_admin_menus_path

              click_link "Add New Menu"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Menus::Menu.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:menu, :name => "A name") }

          it "should succeed" do
            visit refinery.menus_admin_menus_path

            within ".actions" do
              click_link "Edit this menu"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:menu, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.menus_admin_menus_path

            click_link "Remove this menu forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Menus::Menu.count.should == 0
          end
        end

      end
    end
  end
end
