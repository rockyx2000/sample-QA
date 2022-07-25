class AddUseridToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :user_id, :integer, null: false
  end
end
