class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :rg
      t.string :issuing_agency
      t.string :cpf
      t.string :name
      t.string :zip_code
      t.string :phone1
      t.string :phone2
      t.string :email
      t.string :type
      t.string :login
      t.string :password
      t.string :confirm_password
      t.string :address
      t.boolean :activated, default: false
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
