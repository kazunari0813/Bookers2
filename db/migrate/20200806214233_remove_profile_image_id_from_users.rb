class RemoveProfileImageIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :profileimageid, :string
  end
end
