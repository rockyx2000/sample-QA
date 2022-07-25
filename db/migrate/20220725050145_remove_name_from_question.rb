class RemoveNameFromQuestion < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :name, :string
  end
end
