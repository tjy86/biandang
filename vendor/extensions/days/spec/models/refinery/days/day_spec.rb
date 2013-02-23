require 'spec_helper'

module Refinery
  module Days
    describe Day do
      describe "validations" do
        subject do
          FactoryGirl.create(:day,
          :day => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:day) { should == "Refinery CMS" }
      end
    end
  end
end
