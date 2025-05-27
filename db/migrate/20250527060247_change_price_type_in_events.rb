class ChangePriceTypeInEvents < ActiveRecord::Migration[8.0]
  def change
    change_column :events, :price, :string
  end
end
