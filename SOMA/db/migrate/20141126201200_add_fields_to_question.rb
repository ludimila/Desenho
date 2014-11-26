class AddFieldsToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :right_answer, :integer, default: 0
    add_column :questions, :command, :string, default: nil
    add_column :questions, :options_amount, :integer, default: 4
  end
end
