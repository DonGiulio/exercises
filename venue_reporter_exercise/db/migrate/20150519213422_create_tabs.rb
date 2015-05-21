class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.references :venue, index: true

      t.timestamps null: false
    end
    add_foreign_key :tabs, :venues
  end
end
