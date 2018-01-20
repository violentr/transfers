class TransferSerializer < ActiveModel::Serializer
  attributes :id, :account_number_from, :account_number_to, :amount_pennies, :country_code_from, :country_code_to, :user_id
end
