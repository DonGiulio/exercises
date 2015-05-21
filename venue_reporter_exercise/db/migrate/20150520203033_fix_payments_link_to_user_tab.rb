class FixPaymentsLinkToUserTab < ActiveRecord::Migration
  def change
    remove_column :payments, :belongs_to_id
    add_column :payments, :user_tab_id, :integer
  end
end
