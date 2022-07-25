class ChangeTypeToUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :name, :string, null: false, default: "", unique: true
  end
end
