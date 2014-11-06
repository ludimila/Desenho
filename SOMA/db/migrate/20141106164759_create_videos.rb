class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :course, index: true

      t.timestamps
    end
  end
end
