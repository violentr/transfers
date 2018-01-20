require 'rails_helper'

RSpec.describe Transfer, type: :model do
  model_attributes = [:account_number_from, :account_number_to, :amount_pennies, :country_code_from, :country_code_to]
  model_attributes.each do |attribute|
    it { is_expected.to respond_to(attribute) }
  end
end
