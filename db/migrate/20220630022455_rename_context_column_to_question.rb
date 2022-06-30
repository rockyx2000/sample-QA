class RenameContextColumnToQuestion < ActiveRecord::Migration[7.0]
  def change
    rename_column :questions, :context, :content
  end
end
