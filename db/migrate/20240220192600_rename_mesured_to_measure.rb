class RenameMesuredToMeasure < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :measure, :measure
  end
end
