class AddLastUpdatesToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :last_updates, :text
  end
end
