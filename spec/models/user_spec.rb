require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to respond_to(:first_name) }
  it { is_expected.to respond_to(:last_name) }
  it { is_expected.to respond_to(:address_line_1) }
  it { is_expected.to respond_to(:dob) }

  describe "User" do
    [:first_name, :last_name, :address_line_1, :dob].each do |attribute|
      constraits = OpenStruct.new(first_name: 20, last_name: 20, address_line_1: 50, dob: Date)

      context "when has valid #{attribute}" do
        it "#{attribute} should be #{constraits.send(attribute)} " do
          user = create(:user)
          expect(user).to be_valid
        end
      end
    end
  end
end
