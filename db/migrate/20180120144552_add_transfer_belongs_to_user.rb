class AddTransferBelongsToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :transfers, :user, index: true
  end
end
