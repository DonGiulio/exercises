class CreateUserTabs < ActiveRecord::Migration
  def change
    create_table :user_tabs do |t|
      t.references :tab, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_tabs, :tabs
    add_foreign_key :user_tabs, :users
  end
end
