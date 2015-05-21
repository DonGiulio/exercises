class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.references :belongs_to, index: true

      t.timestamps null: false
    end
    add_foreign_key :payments, :belongs_tos
  end
end
