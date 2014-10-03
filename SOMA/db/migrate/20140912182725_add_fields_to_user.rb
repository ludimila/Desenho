class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :activated_at, :time
    add_column :users, :street, :string
    add_column :users, :number, :string
    add_column :users, :complement, :string
    add_column :users, :district, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    remove_column :users, :address, :string
  end
end
