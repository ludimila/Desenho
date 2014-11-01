class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :doctor, index: true
      t.string :name
      t.float :workload

      t.timestamps
    end
  end
end
