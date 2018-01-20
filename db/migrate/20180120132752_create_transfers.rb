class CreateTransfers < ActiveRecord::Migration[5.0]
  def change
    create_table :transfers do |t|
      t.string :account_number_from, null: false
      t.string :account_number_to, null: false
      t.integer :amount_pennies, null: false
      t.string :country_code_from, null: false
      t.string :country_code_to, null: false
      t.timestamps
    end
  end
end
