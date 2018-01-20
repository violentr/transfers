require 'rails_helper'

RSpec.describe User, type: :model do
  constraits = OpenStruct.new(first_name: 20, last_name: 20, address_line_1: 50, dob: Date)
  model_attributes = [:first_name, :last_name, :address_line_1]
  it { is_expected.to respond_to(:first_name) }
  it { is_expected.to respond_to(:last_name) }
  it { is_expected.to respond_to(:address_line_1) }
  it { is_expected.to respond_to(:dob) }

  describe "model constraits" do

    context "when valid " do
      before do
        @user = create(:user)
      end
      model_attributes.each do |attribute|

        it "#{attribute} should be  <= #{constraits.send(attribute)} chars" do
          expect(@user).to be_valid
        end
      end
      it 'dob should be a Date' do
        expect(@user.dob).to be_a(Date)
      end
    end
    context "when invalid " do
      before do
        long_first_name = ('a'..'z').to_a.join
        long_last_name = ('a'..'z').to_a.join
        address_line_1 = long_first_name.concat(long_first_name*2)
        dob = 'some_date'
        @user = build(:user, first_name: long_first_name,
                      last_name: long_last_name, address_line_1: address_line_1, dob: dob)
      end
      model_attributes.each do |attribute|
        it "#{attribute} should be > #{constraits.send(attribute)} chars " do
          expect(@user.valid?).to eq(false)
        end
      end
      it 'dob should not be a Date' do
        expect(@user.dob).not_to be_a(Date)
      end
    end
  end
end
