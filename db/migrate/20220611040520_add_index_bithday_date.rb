class AddIndexBithdayDate < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :birthday_date
  end
end
