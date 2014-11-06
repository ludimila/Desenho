class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :course, index: true

      t.timestamps
    end
  end
end
