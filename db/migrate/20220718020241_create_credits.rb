class CreateCredits < ActiveRecord::Migration[6.1]
  def change
    create_table :credits do |t|
      t.string :payment_type
      t.integer :credit_value
      t.integer :installment_number
      t.string :interest_type
      t.float :interest_rate

      t.timestamps
    end
  end
end
