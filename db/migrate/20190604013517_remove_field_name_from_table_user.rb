class RemoveFieldNameFromTableUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name, :string
    remove_column :users, :age, :integer
    remove_column :users, :interest, :text
  end
end
