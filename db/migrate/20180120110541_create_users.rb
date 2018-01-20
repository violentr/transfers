class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, limit: 20
      t.string :last_name, null: false, limit: 20
      t.string :address_line_1, null: false, limit: 50
      t.date :dob, null: false
      t.timestamps
    end
  end
end
