class CreateUserSmartPoints < ActiveRecord::Migration
  def change
    create_table :user_smart_points do |t|
      t.string :user_mac
      t.string :spoint_mac
      t.datetime :date

      t.timestamps null: false
    end
  end
end
