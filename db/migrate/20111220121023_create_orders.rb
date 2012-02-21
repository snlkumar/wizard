class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :shipping_name
      t.string :billing_name
      t.string :employee_number
      t.string :first_name
      t.string :last_name
      t.string :middle_name
       t.date  :joining_date
       t.date :date_of_birth
      t.timestamps
    end
  end
end
