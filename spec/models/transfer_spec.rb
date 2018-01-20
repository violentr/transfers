require 'rails_helper'

RSpec.describe Transfer, type: :model do
  model_attributes = [:account_number_from, :account_number_to, :amount_pennies, :country_code_from, :country_code_to]
  constraits = OpenStruct.new(account_number_from: 18,
                              account_number_to: 18, amount_pennies: 0,
                              country_code_to: 3, country_code_from: 3)
  model_attributes.each do |attribute|
    it { is_expected.to respond_to(attribute) }
  end
  describe 'model constraits' do
    context "when valid " do
      before do
        @transfer= create(:transfer)
      end
      model_attributes.each do |attribute|

        it "#{attribute} should be #{constraits.send(attribute)} chars" do
          expect(@transfer).to be_valid
        end
      end

      it '"amount_pennies" should be as Int' do
        expect(@transfer.amount_pennies).to be_a(Integer)
      end
    end
  end
end
