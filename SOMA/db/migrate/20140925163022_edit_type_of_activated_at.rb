class EditTypeOfActivatedAt < ActiveRecord::Migration
  def change
    change_column :users, :activated_at, :date
  end
end
