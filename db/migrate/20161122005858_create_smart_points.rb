class CreateSmartPoints < ActiveRecord::Migration
  def change
    create_table :smart_points do |t|
      t.string :name
      t.string :lat
      t.string :long
      t.string :date
      t.string :macaddress

      t.timestamps null: false
    end
  end
end
