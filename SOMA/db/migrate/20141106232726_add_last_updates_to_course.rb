class AddLastUpdatesToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :last_updates, :string
  end
end
