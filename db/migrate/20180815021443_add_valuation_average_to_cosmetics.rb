class AddValuationAverageToCosmetics < ActiveRecord::Migration[5.2]
  def change
    add_column :cosmetics, :valuation_average, :integer
  end
end
