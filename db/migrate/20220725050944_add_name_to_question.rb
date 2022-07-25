class AddNameToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :name, :string, null: false
  end
end
