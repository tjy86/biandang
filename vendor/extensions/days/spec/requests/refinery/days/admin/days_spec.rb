# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Days" do
    describe "Admin" do
      describe "days" do
        login_refinery_user

        describe "days list" do
          before do
            FactoryGirl.create(:day, :day => "UniqueTitleOne")
            FactoryGirl.create(:day, :day => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.days_admin_days_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.days_admin_days_path

            click_link "Add New Day"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Day", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Days::Day.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Day can't be blank")
              Refinery::Days::Day.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:day, :day => "UniqueTitle") }

            it "should fail" do
              visit refinery.days_admin_days_path

              click_link "Add New Day"

              fill_in "Day", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Days::Day.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:day, :day => "A day") }

          it "should succeed" do
            visit refinery.days_admin_days_path

            within ".actions" do
              click_link "Edit this day"
            end

            fill_in "Day", :with => "A different day"
            click_button "Save"

            page.should have_content("'A different day' was successfully updated.")
            page.should have_no_content("A day")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:day, :day => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.days_admin_days_path

            click_link "Remove this day forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Days::Day.count.should == 0
          end
        end

      end
    end
  end
end
