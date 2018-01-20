require 'rails_helper'

RSpec.describe Transfer, type: :model do
  model_attributes = [:account_number_from, :account_number_to, :country_code_from, :country_code_to]
  constraits = OpenStruct.new(account_number_from: 18,
                              account_number_to: 18, amount_pennies: 0,
                              country_code_to: 3, country_code_from: 3)
  model_attributes.each do |attribute|
    it { is_expected.to respond_to(attribute) }
  end

  it { is_expected.to respond_to(:user) }

  describe 'model constraits' do
    context "when valid " do
      before do
        user = create(:user)
        @transfer= create(:transfer, user_id: user.id)
      end
      model_attributes.each do |attribute|

        it "#{attribute} should be #{constraits.send(attribute)} chars" do
          expect(@transfer).to be_valid
        end
      end

      it '"amount_pennies" should be Int' do
        expect(@transfer.amount_pennies).to be_a(Integer)
      end
    end

    context "when invalid " do
      before do
        long_string = ('a'..'z').to_a.join
        amount = -10
        @transfer= build(:transfer, amount_pennies: amount,
                      account_number_to: long_string, account_number_from: long_string,
                      country_code_from: 'eqweqwew', country_code_to: 'dasdasd')
      end
      model_attributes.each do |attribute|
        it "#{attribute} should be > #{constraits.send(attribute)} chars " do
          expect(@transfer.valid?).to eq(false)
        end
      end
      it '"amount_pennies" should be not Int' do
        expect(@transfer.valid?).to eq(false)
      end
    end
  end
end
