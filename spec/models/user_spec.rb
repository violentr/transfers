require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to respond_to(:first_name) }
  it { is_expected.to respond_to(:last_name) }
  it { is_expected.to respond_to(:address_line_1) }
  it { is_expected.to respond_to(:dob) }
end
