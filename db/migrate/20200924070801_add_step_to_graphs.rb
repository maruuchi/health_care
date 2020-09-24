class AddStepToGraphs < ActiveRecord::Migration[5.2]
  def change
    add_column :graphs, :step, :float
  end
end
