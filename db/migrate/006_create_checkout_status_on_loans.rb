class CreateCheckoutStatusOnLoans < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :status, :string
  end
end
