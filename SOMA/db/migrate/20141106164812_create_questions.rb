class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :course, index: true

      t.timestamps
    end
  end
end
