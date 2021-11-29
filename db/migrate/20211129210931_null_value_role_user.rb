class NullValueRoleUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :role_id, :bigint, :null => true
  end
end
