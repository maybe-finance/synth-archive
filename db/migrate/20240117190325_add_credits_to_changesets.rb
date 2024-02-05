class AddCreditsToChangesets < ActiveRecord::Migration[7.2]
  def change
    add_column :changesets, :credits, :integer, default: 0
  end
end
