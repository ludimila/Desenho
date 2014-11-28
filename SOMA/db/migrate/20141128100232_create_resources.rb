class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.references :course, index: true
      t.string :type
      t.string :description, default: nil
      t.attachment :document

      t.integer  :right_answer,   default: 0
      t.integer  :options_amount, default: 4
      t.timestamps
    end

    drop_table :documents do |t|
      t.references :course, index: true
      t.attachment :document
      t.string :description, default: nil
      t.timestamps
    end

    drop_table :questions do |t|
      t.references :course, index: true
      t.string   :command
      t.integer  :right_answer,   default: 0
      t.integer  :options_amount, default: 4
      t.timestamps
    end
    
    drop_table :videos do |t|
      t.references :course, index: true
      t.timestamps
    end
  end
end
